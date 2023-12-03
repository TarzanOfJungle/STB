import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/extensions/set_text_editing_controller_value.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/common/widgets/button_row/button_row.dart';
import 'package:split_the_bill/common/widgets/button_row/button_row_item.dart';
import 'package:split_the_bill/common/widgets/components/icon_button_with_background.dart';
import 'package:split_the_bill/common/widgets/components/stb_elevated_button.dart';
import 'package:split_the_bill/common/widgets/components/stb_number_input_field.dart';
import 'package:split_the_bill/common/widgets/dialogs/confirmation_dialog.dart';
import 'package:split_the_bill/common/widgets/loading_indicator.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/purchases/controllers/single_purchase_controller.dart';
import 'package:split_the_bill/purchases/models/new_purchase/purchase_state.dart';

const _INCREMENT_BUTTONS_WIDTH = 120.0;

class PurchaseEditingSection extends StatefulWidget {
  final PurchaseState purchaseState;

  const PurchaseEditingSection({
    super.key,
    required this.purchaseState,
  });

  @override
  State<PurchaseEditingSection> createState() => _PurchaseEditingSectionState();
}

class _PurchaseEditingSectionState extends State<PurchaseEditingSection> {
  final _purchaseQuantityController = TextEditingController();
  final _purchaseUnitPriceController = TextEditingController();

  final _purchaseController = get<SinglePurchaseController>();
  final _navRouter = get<NavRouter>();

  @override
  Widget build(BuildContext context) {
    _adjustTextEditingControllersToNewState(widget.purchaseState);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 30,
        ),
        _buildTitle(context),
        const SizedBox(
          height: STANDARD_PADDING,
        ),
        _buildMyPurchase(context),
        const SizedBox(
          height: 20,
        ),
        _buildSaveButton(context),
      ],
    );
  }

  void _adjustTextEditingControllersToNewState(PurchaseState newState) {
    _purchaseQuantityController.setValue(newState.editedQuantity?.toString());

    // Unit price TF doesn't need to be adjusted continuously, just on initial load
    if (newState.editedUnitPrice != null &&
        _purchaseUnitPriceController.text.isEmpty) {
      final unitPriceHasDecimal = newState.editedUnitPrice!.roundToDouble() !=
          newState.editedUnitPrice!;
      final unitPriceStringValue = unitPriceHasDecimal
          ? newState.editedUnitPrice!.toString()
          : newState.editedUnitPrice!.toStringAsFixed(0);

      _purchaseUnitPriceController.setValue(unitPriceStringValue);
    }
  }

  Widget _buildTitle(BuildContext context) {
    final text = _purchaseController.isUsersFirstPurchase
        ? "Add your purchase"
        : "Update your purchase";
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        if (!_purchaseController.isUsersFirstPurchase)
          IconButtonWithBackground(
            onTap: () => _showDeleteDialog(),
            icon: Icons.close_rounded,
            backgroundColor: UiConstants.deleteColor,
            iconColor: Colors.white,
          )
      ],
    );
  }

  Widget _buildMyPurchase(context) {
    final isMin = widget.purchaseState.editedQuantity == null ||
        widget.purchaseState.editedQuantity == 0;
    final isMax = widget.purchaseState.editedQuantity ==
        widget.purchaseState.totalQuantityToBePurchased;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: StbNumberInputField(
                controller: _purchaseQuantityController,
                label: "Quantity",
                prefix: const Icon(
                  UiConstants.quantityIcon,
                  size: 15,
                ),
                onChanged: (value) {
                  final newQuantity = _getAdditionalValueFromString(
                      value, (toParse) => int.tryParse(toParse));
                  _purchaseController.additionalQuantityChanged(newQuantity);
                },
              ),
            ),
            const SizedBox(width: STANDARD_PADDING),
            ButtonRow(
              fixedWidth: _INCREMENT_BUTTONS_WIDTH,
              buttons: [
                ButtonRowItem(
                  buttonChild: const Icon(Icons.remove_rounded),
                  enabled: !isMin,
                  onTap: () => _addToQuantity(-1),
                ),
                ButtonRowItem(
                  buttonChild: const Icon(Icons.add_rounded),
                  enabled: !isMax,
                  onTap: () => _addToQuantity(1),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: STANDARD_PADDING),
        StbNumberInputField(
          controller: _purchaseUnitPriceController,
          label: "Unit price",
          allowDecimals: true,
          prefix: const Icon(
            UiConstants.ammountIcon,
            size: 15,
          ),
          suffix: const Text(",-"),
          onChanged: (value) {
            final newUnitPrice = _getAdditionalValueFromString(
                value, (toParse) => double.tryParse(toParse));
            _purchaseController.additionalUnitPriceChanged(newUnitPrice);
          },
        ),
      ],
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    final enabled = _purchaseController.dataValidForSaving();
    final buttonText = _purchaseController.isUsersFirstPurchase
        ? "Add my purchase"
        : "Update my purchase";

    return StreamBuilder(
      stream: _purchaseController.isLoadingStream,
      builder: (context, snapshot) {
        final isLoading = snapshot.data ?? true;
        if (isLoading) {
          return const LoadingIndicator();
        }
        return StbElevatedButton(
          leadingIcon: Icons.shopping_cart_rounded,
          text: buttonText,
          stretch: true,
          enabled: enabled,
          onTap: () async {
            final success = await _purchaseController.saveChanges();
            if (success) {
              _navRouter.returnBack();
            }
          },
        );
      },
    );
  }

  void _showDeleteDialog() {
    final currentlyPurchasedQuantity =
        widget.purchaseState.existingPurchaseOfCurrentUser?.quantity ?? 0;
    showDialog(
      context: context,
      builder: (context) => ConfirmationDialog(
        label: "Cancel your purchase",
        description:
            "You purchased $currentlyPurchasedQuantity pieces of this item. Are you sure you want to cancel your purchase?",
        confirmText: "Yes",
        cancelText: "No",
        onConfirm: () async {
          final success = await _purchaseController.deleteExistingPurchase();
          if (success) {
            _navRouter.returnBack();
          }
        },
      ),
    );
  }

  void _addToQuantity(int quantityToAdd) {
    final newQuantity =
        (widget.purchaseState.editedQuantity ?? 0) + quantityToAdd;
    _purchaseController.additionalQuantityChanged(newQuantity);
  }

  T? _getAdditionalValueFromString<T extends num>(
    String value,
    T? Function(String) parseFunction,
  ) {
    final parsed = parseFunction(value);
    if (parsed == 0) {
      return null;
    }
    return parsed;
  }
}

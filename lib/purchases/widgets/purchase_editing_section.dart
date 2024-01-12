import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/extensions/set_text_editing_controller_value.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/common/widgets/components/icon_button_with_background.dart';
import 'package:split_the_bill/common/widgets/components/quantity_editing_section.dart';
import 'package:split_the_bill/common/widgets/components/stb_elevated_button.dart';
import 'package:split_the_bill/common/widgets/components/stb_number_input_field.dart';
import 'package:split_the_bill/common/widgets/dialogs/confirmation_dialog.dart';
import 'package:split_the_bill/common/widgets/loading_indicator.dart';
import 'package:split_the_bill/common/widgets/wrappers/stream_builder_with_handling.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/purchases/controllers/single_purchase_controller.dart';
import 'package:split_the_bill/purchases/models/purchase_state/purchase_state.dart';

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
  final _purchaseUnitPriceController = TextEditingController();

  final _purchaseController = get<SinglePurchaseController>();
  final _navRouter = get<NavRouter>();

  @override
  void dispose() {
    _purchaseUnitPriceController.dispose();
    super.dispose();
  }

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
    final decrementEnabled = widget.purchaseState.editedQuantity != null &&
        widget.purchaseState.editedQuantity! > 0;
    final incrementEnabled = widget.purchaseState.totalPurchasedQuantity <
        widget.purchaseState.totalQuantityToBePurchased;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        QuantityEditingSection(
            label: "Quantity",
            currentValue: widget.purchaseState.editedQuantity,
            decrementEnabled: decrementEnabled,
            incrementEnabled: incrementEnabled,
            onQuantityChanged: (newQuantity) {
              final editedValue = _getEditedValueFromString(
                  newQuantity.toString(),
                  (stringValue) => int.tryParse(stringValue));
              _purchaseController.editedQuantityChanged(editedValue);
            }),
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
            final newUnitPrice = _getEditedValueFromString(
                value, (toParse) => double.tryParse(toParse));
            _purchaseController.editedUnitPriceChanged(newUnitPrice);
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

    return StreamBuilderWithHandling(
      stream: _purchaseController.isLoadingStream,
      buildWhenData: (context, isLoading) {
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

  T? _getEditedValueFromString<T extends num>(
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

import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/extensions/set_text_editing_controller_value.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/common/widgets/components/icon_button_with_background.dart';
import 'package:split_the_bill/common/widgets/components/stb_number_input_field_incremental.dart';
import 'package:split_the_bill/common/widgets/components/stb_elevated_button.dart';
import 'package:split_the_bill/common/widgets/components/stb_number_input_field.dart';
import 'package:split_the_bill/common/widgets/loading_indicator.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/purchases/controllers/single_purchase_controller.dart';
import 'package:split_the_bill/purchases/models/new_purchase/purchase_state.dart';

const _INPUT_FIELDS_WIDTH = 290.0;

class PurchaseEditingSection extends StatefulWidget {
  final PurchaseState state;

  const PurchaseEditingSection({
    super.key,
    required this.state,
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
    _adjustTextEditingControllersToNewState(widget.state);

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
    _purchaseQuantityController
        .setValue(newState.currentUserPurchaseQuantity?.toString());

    // Unit price TF doesn't need to be adjusted continuously, just on initial load
    if (newState.currentUserPurchaseUnitPrice != null &&
        _purchaseUnitPriceController.text.isEmpty) {
      final unitPriceHasDecimal =
          newState.currentUserPurchaseUnitPrice!.roundToDouble() !=
              newState.currentUserPurchaseUnitPrice!;
      final unitPriceStringValue = unitPriceHasDecimal
          ? newState.currentUserPurchaseUnitPrice!.toString()
          : newState.currentUserPurchaseUnitPrice!.toStringAsFixed(0);

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
            onTap: () async {
              final success =
                  await _purchaseController.deleteExistingPurchase();
              if (success) {
                _navRouter.returnBack();
              }
            },
            icon: Icons.close_rounded,
            backgroundColor: UiConstants.deleteColor,
            iconColor: Colors.white,
          )
      ],
    );
  }

  Widget _buildMyPurchase(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StbNumberInputFieldIncremental(
          controller: _purchaseQuantityController,
          label: "Quantity",
          fixedWidth: _INPUT_FIELDS_WIDTH,
          prefix: const Icon(
            UiConstants.quantityIcon,
            size: 15,
          ),
          onIncremented: () {
            final newQuantity =
                (widget.state.currentUserPurchaseQuantity ?? 0) + 1;
            _purchaseController.additionalQuantityChanged(newQuantity);
          },
          onDecremented: () {
            final newQuantity =
                (widget.state.currentUserPurchaseQuantity ?? 0) - 1;
            _purchaseController.additionalQuantityChanged(newQuantity);
          },
          onChanged: (value) {
            final newQuantity =
                _purchaseController.getAdditionalValueFromString(
                    value, (toParse) => int.tryParse(toParse));
            _purchaseController.additionalQuantityChanged(newQuantity);
          },
        ),
        const SizedBox(height: STANDARD_PADDING),
        StbNumberInputField(
          controller: _purchaseUnitPriceController,
          label: "Unit price",
          fixedWidth: _INPUT_FIELDS_WIDTH,
          allowDecimals: true,
          prefix: const Icon(
            UiConstants.ammountIcon,
            size: 15,
          ),
          suffix: const Text(",-"),
          onChanged: (value) {
            final newUnitPrice =
                _purchaseController.getAdditionalValueFromString(
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
}

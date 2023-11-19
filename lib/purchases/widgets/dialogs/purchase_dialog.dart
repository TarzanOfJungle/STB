import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/widgets/components/stb_elevated_button.dart';
import 'package:split_the_bill/common/widgets/components/stb_number_input_field.dart';
import 'package:split_the_bill/common/widgets/loading_indicator.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/purchases/controllers/single_purchase_controller.dart';
import 'package:split_the_bill/purchases/models/new_purchase/purchase_state.dart';

const _QUANTITY_ICON = Icons.functions_rounded;
const _AMMOUNT_ICON = Icons.paid_rounded;
const _INPUT_FIELDS_WIDTH = 150.0;

class PurchaseDialog extends StatefulWidget {
  const PurchaseDialog({
    super.key,
  });

  @override
  State<PurchaseDialog> createState() => _PurchaseDialogState();
}

class _PurchaseDialogState extends State<PurchaseDialog> {
  final _purchaseQuantityController = TextEditingController();
  final _purchaseUnitPriceController = TextEditingController();

  final _purchaseController = get<SinglePurchaseController>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _purchaseController.purchaseStateStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const LoadingIndicator();
        }
        final state = snapshot.data!;
        _adjustTextEditingControllersToNewState(state);
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 26,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTitle(context, state),
                const SizedBox(height: STANDARD_PADDING),
                _buildGeneralInfo(context, state),
                const Divider(height: 30),
                _buildYourPurchase(context),
                const SizedBox(height: 30),
                _buildConfirmButton(context, state),
              ],
            ),
          ),
        );
      },
    );
  }

  void _adjustTextEditingControllersToNewState(PurchaseState newState) {
    _adjustTextEditingControllerToNewValue(
      _purchaseQuantityController,
      newState.currentUserPurchaseQuantity?.toString(),
    );
    // Unit price TF doesn't need to be adjusted continuously, just on initial load
    if (newState.currentUserPurchaseUnitPrice != null &&
        _purchaseUnitPriceController.text.isEmpty) {
      final unitPriceHasDecimal =
          newState.currentUserPurchaseUnitPrice!.roundToDouble() !=
              newState.currentUserPurchaseUnitPrice!;
      final unitPriceStringValue = unitPriceHasDecimal
          ? newState.currentUserPurchaseUnitPrice!.toString()
          : newState.currentUserPurchaseUnitPrice!.toStringAsFixed(0);
      _adjustTextEditingControllerToNewValue(
        _purchaseUnitPriceController,
        unitPriceStringValue,
      );
    }
  }

  void _adjustTextEditingControllerToNewValue(
    TextEditingController controller,
    String? newValue,
  ) {
    controller.text = newValue ?? "";
    controller.selection = TextSelection.collapsed(
      offset: controller.text.length,
    );
  }

  Widget _buildTitle(BuildContext context, PurchaseState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.shopping_cart_rounded, size: 40),
        const SizedBox(
          width: STANDARD_PADDING,
        ),
        Expanded(
          child: Text(
            state.existingAssignment.product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget _buildGeneralInfo(BuildContext context, PurchaseState state) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildGeneralInfoRow(
          context: context,
          icon: _QUANTITY_ICON,
          label: "Purchased Quantity: ",
          value:
              "${state.totalPurchasedQuantity}/${state.quantityToBePurchased}",
        ),
        _buildGeneralInfoRow(
          context: context,
          icon: _AMMOUNT_ICON,
          label: "Purchased ammount: ",
          value: "${state.totalPurchasedAmmount.toStringAsFixed(1)},-",
        ),
      ],
    );
  }

  Widget _buildGeneralInfoRow({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 23,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          )
        ],
      ),
    );
  }

  Widget _buildYourPurchase(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your purchase",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: STANDARD_PADDING,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            StbNumberInputField(
              controller: _purchaseUnitPriceController,
              fixedWidth: _INPUT_FIELDS_WIDTH,
              label: "Unit price",
              prefix: const Icon(
                _AMMOUNT_ICON,
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
            StbNumberInputField(
              controller: _purchaseQuantityController,
              fixedWidth: _INPUT_FIELDS_WIDTH,
              label: "Quantity",
              prefix: const Icon(
                _QUANTITY_ICON,
                size: 15,
              ),
              allowDecimals: false,
              onChanged: (value) {
                final newQuantity =
                    _purchaseController.getAdditionalValueFromString(
                        value, (toParse) => int.tryParse(toParse));
                _purchaseController.additionalQuantityChanged(newQuantity);
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildConfirmButton(BuildContext context, PurchaseState state) {
    return StbElevatedButton(
      leadingIcon: Icons.shopping_cart_rounded,
      text: "Confirm purchse",
      onTap: () => print("purchased"),
    );
  }
}

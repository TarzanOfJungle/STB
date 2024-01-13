import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/common/widgets/components/quantity_editing_section.dart';
import 'package:split_the_bill/common/widgets/components/stb_elevated_button.dart';
import 'package:split_the_bill/common/widgets/dialogs/stb_dialog.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/purchases/controllers/single_purchase_controller.dart';
import 'package:split_the_bill/purchases/models/purchase_state/purchase_state.dart';

class UpdateProductAssignmentQuantityDialog extends StatefulWidget {
  final PurchaseState purchaseState;

  const UpdateProductAssignmentQuantityDialog({
    super.key,
    required this.purchaseState,
  });

  @override
  State<UpdateProductAssignmentQuantityDialog> createState() =>
      _UpdateProductAssignmentQuantityDialogState();
}

class _UpdateProductAssignmentQuantityDialogState
    extends State<UpdateProductAssignmentQuantityDialog> {
  late int? _quantityToBePurchased =
      widget.purchaseState.existingAssignment.quantity;
  final _navRouter = get<NavRouter>();
  final _singlePurchaseController = get<SinglePurchaseController>();

  @override
  Widget build(BuildContext context) {
    return StbDialog(
      title: "Update quantity to be purchased",
      titleIcon: UiConstants.quantityIcon,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final decrementEnabled =
        _quantityToBePurchased != null && _quantityToBePurchased! > 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        QuantityEditingSection(
          label: "Quantity to be purchased",
          currentValue: _quantityToBePurchased,
          decrementEnabled: decrementEnabled,
          onQuantityChanged: (newQuantity) =>
              _setQuantityToBePurchased(newQuantity),
        ),
        const SizedBox(height: 20),
        StbElevatedButton(
          text: "Change total quantity",
          enabled: _totalQuantityValid(_quantityToBePurchased),
          leadingIcon: Icons.save_rounded,
          onTap: () {
            if (_quantityToBePurchased != null) {
              _singlePurchaseController
                  .changeProductAssignmentQuantity(_quantityToBePurchased!);
              _navRouter.returnBack();
            }
          },
        ),
      ],
    );
  }

  void _setQuantityToBePurchased(int? newQuantity) {
    setState(() {
      if (_inputAllowed(newQuantity)) {
        _quantityToBePurchased = newQuantity;
      }
    });
  }

  bool _inputAllowed(int? quantity) => quantity == null || quantity >= 0;

  bool _totalQuantityValid(int? newQuantity) {
    return newQuantity != null &&
        newQuantity >= widget.purchaseState.totalPurchasedQuantity;
  }
}

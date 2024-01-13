import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/widgets/components/icon_button_with_background.dart';
import 'package:split_the_bill/common/widgets/page_template.dart';
import 'package:split_the_bill/common/widgets/wrappers/stream_builder_with_handling.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/purchases/controllers/single_purchase_controller.dart';
import 'package:split_the_bill/purchases/models/purchase_state/purchase_state.dart';
import 'package:split_the_bill/purchases/widgets/dialogs/update_product_assignment_quantity_dialog.dart';
import 'package:split_the_bill/purchases/widgets/general_info_label.dart';
import 'package:split_the_bill/purchases/widgets/purchase_editing_section.dart';
import 'package:split_the_bill/purchases/widgets/user_purchase_list_tile.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';

class PurchasePage extends StatelessWidget {
  final _purchaseController = get<SinglePurchaseController>();
  final _shoppingDetailController = get<ShoppingDetailController>();

  PurchasePage({super.key});

  bool get _editingEnabled => !_shoppingDetailController.shoppingIsFinalized;

  @override
  Widget build(BuildContext context) {
    return StreamBuilderWithHandling(
      stream: _purchaseController.purchaseStateStream,
      buildWhenData: (context, state) {
        if (state == null) {
          // Shouldn't ever hapen thanks to stream builder handling
          return const SizedBox.shrink();
        }
        return PageTemplate(
          label: state.existingAssignment.product.name,
          showBackButton: true,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
            children: [
              const SizedBox(height: STANDARD_PADDING),
              _buildGeneralInfo(context, state),
              if (_editingEnabled) PurchaseEditingSection(purchaseState: state),
              const Divider(height: 30),
              ..._buildUserPurchasesList(context, state),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGeneralInfo(BuildContext context, PurchaseState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GeneralInfoLabel(
          icon: UiConstants.quantityIcon,
          value:
              "${state.totalPurchasedQuantity}/${state.totalQuantityToBePurchased}",
          label: "Total Qty.",
          trailingButton: _editingEnabled
              ? IconButtonWithBackground(
                  onTap: () => _showEditTotalQuantityDialog(context, state),
                  icon: Icons.edit,
                )
              : null,
        ),
        GeneralInfoLabel(
          icon: UiConstants.ammountIcon,
          value: "${state.totalPurchasedAmmount.toStringAsFixed(1)},-",
          label: "Total price",
        ),
      ],
    );
  }

  List<Widget> _buildUserPurchasesList(
    BuildContext context,
    PurchaseState state,
  ) {
    final currentUserPurchase =
        _purchaseController.getCurrentUserPuchaseToDisplay();
    if (!_showUserPurchasesList(state)) {
      return [];
    }
    return [
      Text(
        "Purchasers",
        style: Theme.of(context).textTheme.titleLarge,
      ),
      const SizedBox(height: STANDARD_PADDING),
      if (currentUserPurchase != null)
        UserPurchaseListTile(
          userPurchase: currentUserPurchase,
          isCurrentUser: true,
        ),
      ...state.existingPurchasesOfOtherUsers.map(
        (userPurchase) {
          return UserPurchaseListTile(
            userPurchase: userPurchase,
            isCurrentUser: false,
          );
        },
      ).toList()
    ];
  }

  bool _showUserPurchasesList(PurchaseState state) {
    final purchasesAlreadyExist = state.existingPurchases != null;
    final newPurchaseBeingAdded =
        state.editedQuantity != null && state.editedUnitPrice != null;

    return purchasesAlreadyExist || newPurchaseBeingAdded;
  }

  void _showEditTotalQuantityDialog(BuildContext context, PurchaseState state) {
    showDialog(
      context: context,
      builder: (context) =>
          UpdateProductAssignmentQuantityDialog(purchaseState: state),
    );
  }
}

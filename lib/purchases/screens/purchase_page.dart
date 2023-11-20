import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/widgets/error_banner.dart';
import 'package:split_the_bill/common/widgets/loading_indicator.dart';
import 'package:split_the_bill/common/widgets/page_template.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/purchases/controllers/single_purchase_controller.dart';
import 'package:split_the_bill/purchases/models/new_purchase/purchase_state.dart';
import 'package:split_the_bill/purchases/widgets/purchase_editing_section.dart';
import 'package:split_the_bill/purchases/widgets/user_purchase_list_tile.dart';

const _QUANTITY_ICON = Icons.functions_rounded;
const _AMMOUNT_ICON = Icons.paid_rounded;
const _INPUT_FIELDS_WIDTH = 150.0;

class PurchasePage extends StatelessWidget {
  final _purchaseController = get<SinglePurchaseController>();

  PurchasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      label: "Purchase",
      showBackButton: true,
      child: StreamBuilder(
        stream: _purchaseController.purchaseStateStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const ErrorBanner(text: "Something went wrong");
          }
          if (!snapshot.hasData) {
            return const LoadingIndicator();
          }
          final state = snapshot.data!;
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildTitle(context, state),
              const SizedBox(height: STANDARD_PADDING),
              _buildGeneralInfo(context, state),
              PurchaseEditingSection(
                state: state,
                ammountIcon: _AMMOUNT_ICON,
                quantityIcon: _QUANTITY_ICON,
              ),
              ..._buildUserPurchasesList(context, state),
            ],
          );
        },
      ),
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
          ),
        ],
      ),
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
          quantityIcon: _QUANTITY_ICON,
          ammountIcon: _AMMOUNT_ICON,
        ),
      ...state.existingPurchasesOfOtherUsers.map(
        (userPurchase) {
          return UserPurchaseListTile(
            userPurchase: userPurchase,
            isCurrentUser: false,
            quantityIcon: _QUANTITY_ICON,
            ammountIcon: _AMMOUNT_ICON,
          );
        },
      ).toList()
    ];
  }

  bool _showUserPurchasesList(PurchaseState state) {
    final purchasesAlreadyExist = state.existingPurchases != null;
    final newPurchaseBeingAdded = state.currentUserPurchaseQuantity != null &&
        state.currentUserPurchaseUnitPrice != null;

    return purchasesAlreadyExist || newPurchaseBeingAdded;
  }
}
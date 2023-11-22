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

class PurchasePage extends StatelessWidget {
  final _purchaseController = get<SinglePurchaseController>();

  PurchasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _purchaseController.purchaseStateStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const ErrorBanner(text: "Something went wrong");
        }
        if (!snapshot.hasData) {
          return const LoadingIndicator();
        }
        final state = snapshot.data!;
        return PageTemplate(
          label: state.existingAssignment.product.name,
          showBackButton: true,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
            children: [
              const SizedBox(height: STANDARD_PADDING),
              _buildGeneralInfo(context, state),
              PurchaseEditingSection(state: state),
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
        _buildGeneralInfoItem(
          context: context,
          icon: UiConstants.quantityIcon,
          label: "Total Qty.",
          value:
              "${state.totalPurchasedQuantity}/${state.quantityToBePurchased}",
        ),
        _buildGeneralInfoItem(
          context: context,
          icon: UiConstants.ammountIcon,
          label: "Total price",
          value: "${state.totalPurchasedAmmount.toStringAsFixed(1)},-",
        ),
      ],
    );
  }

  Widget _buildGeneralInfoItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 25,
            ),
            const SizedBox(width: 5),
            Text(
              value,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleMedium,
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
    final newPurchaseBeingAdded = state.currentUserPurchaseQuantity != null &&
        state.currentUserPurchaseUnitPrice != null;

    return purchasesAlreadyExist || newPurchaseBeingAdded;
  }
}

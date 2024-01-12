import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/widgets/dialogs/confirmation_dialog.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/purchases/controllers/purchases_controller.dart';
import 'package:split_the_bill/purchases/models/product_purchase/product_purchase.dart';
import 'package:split_the_bill/purchases/models/product_shopping_assignment/product_shopping_assignment.dart';

const _PRODUCT_ASSIGNMENT_COUNT_SIZE = 55.0;

class ProductAssignmentListTile extends StatelessWidget {
  final ProductShoppingAssignment productAssignment;
  final bool enableSwipeToDelete;
  final ProductPurchase? productPurchase;
  final VoidCallback onTap;

  final _purchasesController = get<PurchasesController>();

  ProductAssignmentListTile({
    super.key,
    required this.onTap,
    required this.productAssignment,
    required this.enableSwipeToDelete,
    this.productPurchase,
  });

  @override
  Widget build(BuildContext context) {
    return _buildWithSwipeGesture(
      context,
      InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: STANDARD_PADDING,
            vertical: 13.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildPurchasedCount(context),
              const SizedBox(
                width: STANDARD_PADDING,
              ),
              Expanded(
                child: _buildNameAndDescription(context),
              ),
              _buildPurchasedAmmount(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWithSwipeGesture(BuildContext context, Widget child) {
    if (!enableSwipeToDelete) {
      return child;
    }
    return Slidable(
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            backgroundColor: UiConstants.deleteColor,
            icon: Icons.delete_rounded,
            label: "Delete",
            onPressed: (_) => _showDeleteAssignmentDialog(context),
          )
        ],
      ),
      child: child,
    );
  }

  Widget _buildPurchasedCount(BuildContext context) {
    final toBePurchased = productAssignment.quantity;
    final purchased = productPurchase?.quantityPurchased ?? 0;
    final backgroundColor = _getPurchaseCountColor(toBePurchased, purchased);

    return Container(
      padding: const EdgeInsets.all(4),
      constraints: const BoxConstraints(
        minWidth: _PRODUCT_ASSIGNMENT_COUNT_SIZE,
        minHeight: _PRODUCT_ASSIGNMENT_COUNT_SIZE,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(STANDARD_BORDER_RADIUS),
        color: backgroundColor,
      ),
      child: IntrinsicWidth(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(purchased.toString()),
            Container(
              height: 0.75,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            Text(toBePurchased.toString()),
          ],
        ),
      ),
    );
  }

  Color _getPurchaseCountColor(int toBePurchased, int alreadyPurchased) {
    const opacity = 0.4;

    if (alreadyPurchased == 0) {
      return UiConstants.infoColor.withOpacity(opacity);
    }
    if (alreadyPurchased < toBePurchased) {
      return UiConstants.warningColor.withOpacity(opacity);
    }
    return UiConstants.confirmColor.withOpacity(opacity);
  }

  Widget _buildNameAndDescription(BuildContext context) {
    final product = productAssignment.product;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.name,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        if (product.description != null)
          Text(
            product.description!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(0.8)),
          )
      ],
    );
  }

  Widget _buildPurchasedAmmount(BuildContext context) {
    final purchasedAmmount = productPurchase?.ammountSpent ?? 0;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          purchasedAmmount.toStringAsFixed(1),
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        const Icon(
          Icons.paid_rounded,
        ),
      ],
    );
  }

  void _showDeleteAssignmentDialog(BuildContext context) {
    final productName = productAssignment.product.name;
    const title = "Delete item";
    final message =
        "Are you sure you want to completely remove $productName and all of it's purchases?";
    showDialog(
      context: context,
      builder: (context) => ConfirmationDialog(
        label: title,
        description: message,
        onConfirm: () =>
            _purchasesController.deleteProductAssignemnt(productName),
      ),
    );
  }
}

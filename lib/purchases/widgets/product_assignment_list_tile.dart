import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/purchases/models/product_purchase/product_purchase.dart';
import 'package:split_the_bill/purchases/models/product_shopping_assignment/product_shopping_assignment.dart';

const _PRODUCT_ASSIGNMENT_COUNT_SIZE = 55.0;

class ProductAssignmentListTile extends StatelessWidget {
  final ProductShoppingAssignment productAssignment;
  final ProductPurchase? productPurchase;
  final VoidCallback onTap;

  const ProductAssignmentListTile({
    super.key,
    required this.onTap,
    required this.productAssignment,
    this.productPurchase,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
    const opacity = 0.5;

    if (alreadyPurchased == 0) {
      return Colors.grey.withOpacity(opacity);
    }
    if (alreadyPurchased < toBePurchased) {
      return Colors.amber.withOpacity(opacity);
    }
    return Colors.green.withOpacity(opacity);
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
}

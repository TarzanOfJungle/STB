import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/purchases/models/product_with_purchase_context/product_with_purchase_context.dart';

const _TILE_HEIGHT = 90.0;

class MemberPurchasesPageTile extends StatelessWidget {
  final ProductWithPurchaseContext purchase;
  const MemberPurchasesPageTile({super.key, required this.purchase});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _TILE_HEIGHT,
      child: Padding(
        padding: const EdgeInsets.all(STANDARD_PADDING),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildQuantityAndName(context, purchase),
                  Text(
                    'Unit price: ${purchase.unitPrice},-',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: SMALL_PADDING,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: SMALL_PADDING,
            ),
            _buildTotalDisplay(
                context: context, value: purchase.totalAmountSpent),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityAndName(
      BuildContext context, ProductWithPurchaseContext purchase) {
    return Expanded(
      child: Text(
        '${purchase.quantity}\u00d7 ${purchase.product.name}',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildTotalDisplay({
    required BuildContext context,
    required double value,
  }) {
    return Row(
      children: [
        Text(
          value.toStringAsFixed(1),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(width: SMALL_PADDING),
        const Icon(
          UiConstants.ammountIcon,
          size: 25,
        ),
      ],
    );
  }
}

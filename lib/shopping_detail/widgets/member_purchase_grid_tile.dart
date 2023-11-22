import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/purchases/models/product_with_purchase_context/product_with_purchase_context.dart';
import 'package:split_the_bill/purchases/models/user_purchases/user_purchases.dart';

class MemberPurchaseGridTile extends StatelessWidget {
  final UserPurchases userPurchase;

  const MemberPurchaseGridTile({
    super.key,
    required this.userPurchase,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      width: 300.0,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(STANDARD_BORDER_RADIUS),
      ),
      child: Padding(
        padding: const EdgeInsets.all(SMALL_PADDING),
        child: Column(
          children: [
            Text(
              userPurchase.user.username,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: SMALL_PADDING,
            ),
            Expanded(
                child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, int index) =>
                  _buildPurchaseInfoLine(userPurchase.productPurchases[index]),
              separatorBuilder: (_, __) => const Divider(),
              itemCount: userPurchase.productPurchases.length,
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildPurchaseInfoLine(
      ProductWithPurchaseContext productWithPurchaseContext) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
            '${productWithPurchaseContext.quantity}\u00d7 ${productWithPurchaseContext.product.name}'),
        const Spacer(),
        Text('${productWithPurchaseContext.unitPrice},-'),
      ],
    );
  }
}

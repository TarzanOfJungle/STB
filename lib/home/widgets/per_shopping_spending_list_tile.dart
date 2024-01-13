import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/home/models/shopping_with_spending.dart';

const _COLOR_CIRCLE_SIZE = 8.0;

class PerShoppingSpendingListTile extends StatelessWidget {
  final ShoppingWithSpending shoppingWithSpending;
  final Color shoppingColor;
  const PerShoppingSpendingListTile({
    super.key,
    required this.shoppingWithSpending,
    required this.shoppingColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: _COLOR_CIRCLE_SIZE,
          height: _COLOR_CIRCLE_SIZE,
          decoration: BoxDecoration(
            color: shoppingColor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: STANDARD_PADDING),
        Expanded(
          child: Text(
            shoppingWithSpending.shopping.shopping.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/purchases/models/product_shopping_assignment/product_shopping_assignment.dart';

import '../../users/models/user/user.dart';

class MemberPurchaseGridTile extends StatelessWidget {
  const MemberPurchaseGridTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      width: 300.0,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(STANDARD_BORDER_RADIUS),
      ),
      child: Padding(
        padding: const EdgeInsets.all(SMALL_PADDING),
        child: Column(
          children: [
            const Text(
              'Name goes here',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: SMALL_PADDING,
            ),
            Expanded(
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    Text('something'),
                    Text('Another thing'),
                  ],
            ))
          ],
        ),
      ),
    );
  }
}

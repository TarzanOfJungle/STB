import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/purchases/models/product_with_purchase_context/product_with_purchase_context.dart';
import 'package:split_the_bill/purchases/models/user_purchases/user_purchases.dart';

import '../../ioc_container.dart';

const int _NUMBER_OF_ITEMS = 3;

class MemberPurchasesGridTile extends StatelessWidget {
  final UserPurchases userPurchases;

  MemberPurchasesGridTile({
    super.key,
    required this.userPurchases,
  });

  final _navRouter = get<NavRouter>();

  @override
  Widget build(BuildContext context) {
    var listLength =
        userPurchases.productPurchases.length < _NUMBER_OF_ITEMS + 1
            ? userPurchases.productPurchases.length
            : _NUMBER_OF_ITEMS + 1; // Bonus 1 for ellipsis line
    return Container(
      height: 300.0,
      width: 300.0,
      child: InkWell(
        onTap: () => _navRouter.toMemberPurchases(
          context: context,
          userPurchases: userPurchases,
        ),
        child: Container(
          height: 300.0,
          width: 300.0,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(STANDARD_BORDER_RADIUS),
          ),
          child: Padding(
            padding: const EdgeInsets.all(SMALL_PADDING),
            child: Column(
              children: [
                Text(
                  userPurchases.user.username,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                // const SizedBox(
                //   height: SMALL_PADDING,
                // ),
                Expanded(
                    child: ListView.separated(
                  separatorBuilder: (_, __) => const Divider(),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, int index) {
                    if (index == _NUMBER_OF_ITEMS) {
                      return _buildEllipsisLine(listLength);
                    }
                    return _buildPurchaseInfoLine(
                        userPurchases.productPurchases[index]);
                  },
                  itemCount: listLength,
                )),
                const SizedBox(
                  height: STANDARD_PADDING,
                ),
                _buildTotalAmountLine(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPurchaseInfoLine(
      ProductWithPurchaseContext productWithPurchaseContext) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              '${productWithPurchaseContext.quantity}\u00d7 ${productWithPurchaseContext.product.name}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            width: SMALL_PADDING,
          ),
          Text(
            '${productWithPurchaseContext.totalAmountSpent.toStringAsFixed(productWithPurchaseContext.totalAmountSpent.truncateToDouble() == productWithPurchaseContext.totalAmountSpent ? 0 : 1)},-',
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }

  Widget _buildEllipsisLine(int listLength) {
    return Text(
      'and ${userPurchases.productPurchases.length - (listLength - 1)} more\u2026',
      textAlign: TextAlign.center,
    );
  }

  Widget _buildTotalAmountLine() {
    var totalAmount = userPurchases.productPurchases.fold(0.0,
        (previousValue, purchase) => previousValue + purchase.totalAmountSpent);
    return Row(
      children: [
        const Expanded(
          child: Text('Total amount: '),
        ),
        const SizedBox(
          width: SMALL_PADDING,
        ),
        Text(
          '${totalAmount.toStringAsFixed(totalAmount.truncateToDouble() == totalAmount ? 0 : 1)},-',
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}

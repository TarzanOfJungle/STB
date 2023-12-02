import 'package:flutter/material.dart';
import 'package:split_the_bill/common/widgets/page_template.dart';
import 'package:split_the_bill/purchases/models/user_purchases/user_purchases.dart';
import 'package:split_the_bill/shopping_detail/widgets/member_purchases_page_tile.dart';

class MemberPurchasesPage extends StatelessWidget {
  final UserPurchases userPurchases;

  MemberPurchasesPage({super.key, required this.userPurchases});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
        showBackButton: true,
        label: userPurchases.user.username,
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => MemberPurchasesPageTile(
                    purchase: userPurchases.productPurchases[index]),
                separatorBuilder: (_, __) => const Divider(),
                itemCount: userPurchases.productPurchases.length,
              ),
            )
          ],
        ));
  }
}

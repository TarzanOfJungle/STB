import 'package:flutter/material.dart';
import 'package:split_the_bill/common/widgets/page_template.dart';
import 'package:split_the_bill/purchases/models/user_purchases/user_purchases.dart';

class MemberPurchasesPage extends StatelessWidget {
  final UserPurchases userPurchases;

  const MemberPurchasesPage({super.key, required this.userPurchases});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      label: userPurchases.user.username,
      child: const Center(
        child: Text('list TBD'),
      )
    );
  }
}

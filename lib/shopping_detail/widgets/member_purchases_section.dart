import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/purchases/models/user_purchases/user_purchases.dart';
import 'package:split_the_bill/shopping_detail/widgets/member_purchase_grid_tile.dart';

import '../../ioc_container.dart';
import '../../purchases/controllers/purchases_controller.dart';

class MemberPurchasesSection extends StatelessWidget {
  final _purchasesController = get<PurchasesController>();

  MemberPurchasesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<List<UserPurchases>>(
          stream: _purchasesController.usersWithPurchasesStream,
          builder: (BuildContext context, AsyncSnapshot<List<UserPurchases>> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.data == null) {
              return const Center(child: Text("Nothing yet"));
            } else {
              final usersPurchases = snapshot.data!.toList();
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300.0,
                  crossAxisSpacing: STANDARD_PADDING,
                  mainAxisSpacing: STANDARD_PADDING,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return MemberPurchaseGridTile(userPurchase: usersPurchases[index],);
                },
                itemCount: usersPurchases.length,
              );
            }
          }),
    );
  }
}

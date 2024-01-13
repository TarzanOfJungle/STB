import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/widgets/wrappers/stream_builder_with_handling.dart';
import 'package:split_the_bill/shopping_detail/widgets/member_purchases_grid_tile.dart';

import '../../ioc_container.dart';
import '../../purchases/controllers/purchases_controller.dart';

class MemberPurchasesSection extends StatelessWidget {
  final _purchasesController = get<PurchasesController>();

  MemberPurchasesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilderWithHandling(
        stream: _purchasesController.usersWithPurchasesStream,
        buildWhenData: (context, data) {
          final usersPurchases = data;
          if (usersPurchases.isEmpty) {
            return const SizedBox.shrink();
          }
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300.0,
              crossAxisSpacing: STANDARD_PADDING,
              mainAxisSpacing: STANDARD_PADDING,
            ),
            itemBuilder: (BuildContext context, int index) {
              return MemberPurchasesGridTile(
                userPurchases: usersPurchases[index],
              );
            },
            itemCount: usersPurchases.length,
          );
        });
  }
}

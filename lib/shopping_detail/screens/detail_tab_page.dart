import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';
import 'package:split_the_bill/shopping_detail/widgets/detail_button_section.dart';
import 'package:split_the_bill/shopping_detail/widgets/detail_info_section.dart';
import 'package:split_the_bill/shopping_detail/widgets/member_purchases_section.dart';
import 'package:split_the_bill/shopping_detail/widgets/show_summary_button.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';

import '../../common/widgets/loading_indicator.dart';
import '../../ioc_container.dart';

class DetailTabPage extends StatelessWidget {
  DetailTabPage({super.key});

  final _shoppingDetailController = get<ShoppingDetailController>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _shoppingDetailController.shopping,
        builder: (BuildContext context, AsyncSnapshot<ShoppingWithContext?> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            //TODO page loading
            return const LoadingIndicator();
          }
          var shopping = snapshot.data!;
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(STANDARD_PADDING),
              child: Column(
                children: [
                  Text(shopping.shopping.description ?? ''),
                  const SizedBox(height: STANDARD_PADDING),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DetailInfoSection(shopping: shopping),
                      DetailButtonSection(shopping: shopping),
                    ],
                  ),
                  const SizedBox(height: STANDARD_PADDING),
                  ShowSummaryButton(shopping: shopping),
                  const SizedBox(height: STANDARD_PADDING),
                  MemberPurchasesSection(shopping: shopping),
                ],
              ),
            ),
          );
        },
    );
  }
}

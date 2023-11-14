import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/shopping_detail/widgets/detail_button_section.dart';
import 'package:split_the_bill/shopping_detail/widgets/detail_info_section.dart';
import 'package:split_the_bill/shopping_detail/widgets/member_purchases_section.dart';
import 'package:split_the_bill/shopping_detail/widgets/show_summary_button.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';

class DetailPage extends StatelessWidget {
  final ShoppingWithContext shopping;
  const DetailPage({super.key, required this.shopping});

  @override
  Widget build(BuildContext context) {
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
  }
}

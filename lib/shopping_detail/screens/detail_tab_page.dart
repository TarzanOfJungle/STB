import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/widgets/error_banner.dart';
import 'package:split_the_bill/purchases/controllers/purchases_controller.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';
import 'package:split_the_bill/shopping_detail/widgets/detail_button_section.dart';
import 'package:split_the_bill/shopping_detail/widgets/detail_info_section.dart';
import 'package:split_the_bill/shopping_detail/widgets/member_purchases_section.dart';
import 'package:split_the_bill/shopping_detail/widgets/show_summary_button.dart';

import '../../common/widgets/loading_indicator.dart';
import '../../ioc_container.dart';

class DetailTabPage extends StatelessWidget {
  DetailTabPage({super.key});

  final _shoppingDetailController = get<ShoppingDetailController>();
  final _purchasesController = get<PurchasesController>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Rx.combineLatest2(
          _shoppingDetailController.shopping,
          _purchasesController.productAssignmentsWithPurchasesStream,
          (a, b) => (shopping: a, productAssignments: b)),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const ErrorBanner();
        } else if (!snapshot.hasData) {
          //TODO page loading
          return const LoadingIndicator();
        }
        var shopping = snapshot.data!.shopping;
        var productAssignments = snapshot.data!.productAssignments;
        if (shopping == null || productAssignments == null) {
          return const ErrorBanner();
        }
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: STANDARD_PADDING),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: STANDARD_PADDING),
                    Text(shopping.shopping.description ?? ''),
                    const SizedBox(height: STANDARD_PADDING),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DetailInfoSection(
                          shopping: shopping,
                          productAssignments: productAssignments,
                        ),
                        DetailButtonSection(shopping: shopping),
                      ],
                    ),
                    const SizedBox(height: STANDARD_PADDING),
                    ShowSummaryButton(shopping: shopping),
                    const SizedBox(height: STANDARD_PADDING),
                    MemberPurchasesSection(),
                    const SizedBox(height: STANDARD_PADDING),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

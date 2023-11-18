import 'package:flutter/material.dart';
import 'package:split_the_bill/common/widgets/loading_indicator.dart';
import 'package:split_the_bill/common/widgets/no_data_banner.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/purchases/controllers/purchases_controller.dart';
import 'package:split_the_bill/purchases/widgets/product_assignment_list_tile.dart';

class PurchaseTabPage extends StatelessWidget {
  final _purchasesController = get<PurchasesController>();

  PurchaseTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _purchasesController.productsAssignmentsWithPurchases,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: LoadingIndicator());
          }
          final data = snapshot.data!;
          final dataEmpty =
              data.productAssignments.isEmpty && data.productPurchases.isEmpty;
          if (dataEmpty) {
            return const Center(
              child: NoDataBanner(
                text: "No data found",
              ),
            );
          }
          return ListView.separated(
            itemCount: data.productAssignments.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) => ProductAssignmentListTile(
              productAssignment: data.productAssignments[index],
              productPurchase: data
                  .getProductPurchaseOfAssignment(data.productAssignments[index]),
            ),
          );
        },
      ),
    );
  }
}

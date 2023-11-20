import 'package:flutter/material.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/common/widgets/loading_indicator.dart';
import 'package:split_the_bill/common/widgets/no_data_banner.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/purchases/controllers/purchases_controller.dart';
import 'package:split_the_bill/purchases/models/product_purchase/product_purchase.dart';
import 'package:split_the_bill/purchases/models/product_shopping_assignment/product_shopping_assignment.dart';
import 'package:split_the_bill/purchases/widgets/product_assignment_list_tile.dart';

class PurchasesTabPage extends StatelessWidget {
  final _purchasesController = get<PurchasesController>();
  final _navRouter = get<NavRouter>();

  PurchasesTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _purchasesController.productAssignmentsWithPurchasesStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return _buildLoading();
          }
          final data = snapshot.data!;
          final dataEmpty =
              data.productAssignments.isEmpty && data.productPurchases.isEmpty;
          if (dataEmpty) {
            return _buildNoData();
          }
          return ListView.separated(
            itemCount: data.productAssignments.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final assignment = data.productAssignments[index];
              final existingPurchases = data.getProductPurchaseOfAssignment(
                data.productAssignments[index],
              );
              return ProductAssignmentListTile(
                productAssignment: assignment,
                productPurchase: existingPurchases,
                onTap: () => _goToPurchaseDetail(
                  context: context,
                  assignment: assignment,
                  existingPurchases: existingPurchases,
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(child: LoadingIndicator());
  }

  Widget _buildNoData() {
    return const Center(
      child: NoDataBanner(
        text: "No data found",
      ),
    );
  }

  void _goToPurchaseDetail({
    required BuildContext context,
    required ProductShoppingAssignment assignment,
    ProductPurchase? existingPurchases,
  }) {
    _navRouter.toPurchaseDetail(
      existingAssignment: assignment,
      existingPurchases: existingPurchases,
    );
  }
}
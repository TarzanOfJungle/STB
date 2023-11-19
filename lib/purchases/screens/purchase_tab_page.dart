import 'package:flutter/material.dart';
import 'package:split_the_bill/common/widgets/loading_indicator.dart';
import 'package:split_the_bill/common/widgets/no_data_banner.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/purchases/controllers/purchases_controller.dart';
import 'package:split_the_bill/purchases/controllers/single_purchase_controller.dart';
import 'package:split_the_bill/purchases/models/new_purchase/purchase_state.dart';
import 'package:split_the_bill/purchases/models/product_purchase/product_purchase.dart';
import 'package:split_the_bill/purchases/models/product_shopping_assignment/product_shopping_assignment.dart';
import 'package:split_the_bill/purchases/widgets/dialogs/purchase_dialog.dart';
import 'package:split_the_bill/purchases/widgets/product_assignment_list_tile.dart';

class PurchaseTabPage extends StatelessWidget {
  final _purchasesController = get<PurchasesController>();
  final _singlePurcahseController = get<SinglePurchaseController>();

  PurchaseTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _purchasesController.productsAssignmentsWithPurchases,
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
                onTap: () => _showPurchaseDialog(
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

  void _showPurchaseDialog({
    required BuildContext context,
    required ProductShoppingAssignment assignment,
    ProductPurchase? existingPurchases,
  }) {
    _singlePurcahseController.setPurchase(
      existingAssignment: assignment,
      existingPurchases: existingPurchases,
    );

    showDialog(
      context: context,
      builder: (context) => const PurchaseDialog(),
    );
  }
}

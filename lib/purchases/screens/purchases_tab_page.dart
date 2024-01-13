import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/common/widgets/components/search_field.dart';
import 'package:split_the_bill/common/widgets/no_data_banner.dart';
import 'package:split_the_bill/common/widgets/wrappers/stream_builder_with_handling.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/purchases/controllers/purchases_controller.dart';
import 'package:split_the_bill/purchases/models/product_purchase/product_purchase.dart';
import 'package:split_the_bill/purchases/models/product_shopping_assignment/product_shopping_assignment.dart';
import 'package:split_the_bill/purchases/widgets/product_assignment_list_tile.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';

const _NO_ITEMS_YET =
    "This shopping doesn't have any items. Add some by clicking the button in upper right corner.";

const _NO_ITEMS_IN_FINALIZED = "This shopping did not contain any items.";

const _NOTHING_FOUND_SEARCH_MESSAGE = "No items found";

class PurchasesTabPage extends StatefulWidget {
  const PurchasesTabPage({super.key});

  @override
  State<PurchasesTabPage> createState() => _PurchasesTabPageState();
}

class _PurchasesTabPageState extends State<PurchasesTabPage> {
  final _purchasesController = get<PurchasesController>();
  final _shoppingDetailController = get<ShoppingDetailController>();
  final _navRouter = get<NavRouter>();
  final _searchFieldController = TextEditingController();

  bool get _editingEnabled => !_shoppingDetailController.shoppingIsFinalized;

  @override
  Widget build(BuildContext context) {
    _purchasesController.filterAssignments(null);
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(SMALL_PADDING),
            child: SearchField(
              controller: _searchFieldController,
              onValueChanged: (query) =>
                  _purchasesController.filterAssignments(query),
              onSearchCleared: () {
                _searchFieldController.clear();
                _purchasesController.filterAssignments(null);
              },
            )),
        Expanded(
          child: StreamBuilderWithHandling(
            stream: _purchasesController.filteredAssignmentsStream,
            buildWhenData: (context, data) {
              final dataEmpty = data!.productAssignments.isEmpty &&
                  data.productPurchases.isEmpty;
              final nothingFound = _searchFieldController.text.isNotEmpty &&
                  data.productAssignments.isEmpty;
              if (dataEmpty) {
                return _buildNoData();
              }
              if (nothingFound) {
                return _editingEnabled
                    ? const Text(_NOTHING_FOUND_SEARCH_MESSAGE)
                    : const Text(_NO_ITEMS_IN_FINALIZED);
              }
              return SlidableAutoCloseBehavior(
                child: ListView.separated(
                  itemCount: data.productAssignments.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final assignment = data.productAssignments[index];
                    final existingPurchases =
                        data.getProductPurchaseOfAssignment(
                      data.productAssignments[index],
                    );
                    return ProductAssignmentListTile(
                      productAssignment: assignment,
                      enableSwipeToDelete: _editingEnabled,
                      productPurchase: existingPurchases,
                      onTap: () => _goToPurchaseDetail(
                        context: context,
                        shoppingId: _purchasesController.shoppingId!,
                        assignment: assignment,
                        existingPurchases: existingPurchases,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNoData() {
    return const Center(
      child: NoDataBanner(
        text: _NO_ITEMS_YET,
      ),
    );
  }

  void _goToPurchaseDetail({
    required BuildContext context,
    required int shoppingId,
    required ProductShoppingAssignment assignment,
    ProductPurchase? existingPurchases,
  }) {
    _navRouter.toPurchaseDetail(
      shoppingId: shoppingId,
      existingAssignment: assignment,
      existingPurchases: existingPurchases,
    );
  }
}

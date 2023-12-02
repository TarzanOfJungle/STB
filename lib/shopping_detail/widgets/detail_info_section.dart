import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:split_the_bill/purchases/controllers/purchases_controller.dart';
import 'package:split_the_bill/purchases/models/product_assignments_with_purchases/product_assignments_with_purchases.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';

import '../../ioc_container.dart';
import 'info_item.dart';

class DetailInfoSection extends StatelessWidget {
  late final ShoppingWithContext _shopping;
  late final int _completeItems;
  final _shoppingDetailController = get<ShoppingDetailController>();
  final _purchasesController = get<PurchasesController>();

  DetailInfoSection({super.key}) {
    var assignments =
        _purchasesController.productAssignmentsWithPurchases!;
    _completeItems = assignments.totalItemsPurchased;

    _shopping = _shoppingDetailController.currentShoppingState!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfoItem(
          icon: const Icon(CupertinoIcons.money_dollar),
          label: 'Amount spent',
          data: '${_shopping.ammountSpent},-',
        ),
        InfoItem(
          icon: const Icon(CupertinoIcons.shopping_cart),
          label: 'Items bought',
          data: '$_completeItems/${_shopping.numberOfItems}',
        ),
        InfoItem(
          icon: const Icon(CupertinoIcons.person_2_fill),
          label: 'Members',
          data: '${_shopping.numberOfParticipants}',
        ),
      ],
    );
  }
}

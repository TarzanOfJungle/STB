import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:split_the_bill/purchases/controllers/purchases_controller.dart';
import 'package:split_the_bill/purchases/models/product_assignments_with_purchases/product_assignments_with_purchases.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';

import '../../ioc_container.dart';

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
        _buildInfoItem(
          const Icon(CupertinoIcons.money_dollar),
          'Amount spent',
          '${_shopping.ammountSpent},-',
        ),
        _buildInfoItem(
          const Icon(CupertinoIcons.shopping_cart),
          'Items bought',
          '$_completeItems/${_shopping.numberOfItems}',
        ),
        _buildInfoItem(
          const Icon(CupertinoIcons.person_2_fill),
          'Members',
          '${_shopping.numberOfParticipants}',
        ),
      ],
    );
  }

  Widget _buildInfoItem(Widget icon, String label, String data) {
    return Row(
      children: [
        SizedBox(width: 40.0, child: icon),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(data),
        ])
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:split_the_bill/common/widgets/loading_indicator.dart';
import 'package:split_the_bill/purchases/models/product_assignments_with_purchases/product_assignments_with_purchases.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_detail_controller.dart';
import 'package:split_the_bill/shoppings_list/models/shopping_with_context/shopping_with_context.dart';
import '../../ioc_container.dart';
import 'info_item.dart';

class DetailInfoSection extends StatelessWidget {
  final ShoppingWithContext shopping;
  final ProductAssignmentsWithPurchases productAssignments;

  DetailInfoSection({
    super.key,
    required this.shopping,
    required this.productAssignments,
  });

  final ShoppingDetailController _shoppingDetailController = get<ShoppingDetailController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfoItem(
          icon: const Icon(CupertinoIcons.money_dollar),
          label: 'Amount spent',
          data: '${shopping.ammountSpent},-',
        ),
        InfoItem(
          icon: const Icon(CupertinoIcons.shopping_cart),
          label: 'Items bought',
          data:
              '${productAssignments.totalItemsPurchased}/${shopping.numberOfItems}',
        ),
        InfoItem(
          icon: const Icon(CupertinoIcons.person_2_fill),
          label: 'Members',
          data: '${shopping.numberOfParticipants}',
        ),
      ],
    );
  }
}

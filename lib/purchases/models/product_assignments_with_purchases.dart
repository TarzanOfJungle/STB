import 'package:split_the_bill/purchases/models/product_purchase/product_purchase.dart';
import 'package:split_the_bill/purchases/models/product_shopping_assignment/product_shopping_assignment.dart';

class ProductAssignmentsWithPurchases {
  final List<ProductShoppingAssignment> productAssignments;
  final List<ProductPurchase> productPurchases;

  const ProductAssignmentsWithPurchases({
    required this.productAssignments,
    required this.productPurchases,
  });

  ProductAssignmentsWithPurchases.empty()
      : productAssignments = [],
        productPurchases = [];

  ProductPurchase? getProductPurchaseOfAssignment(
      ProductShoppingAssignment assignment) {
    final matching = productPurchases
        .where((purchase) => purchase.product.id == assignment.product.id);

    return matching.firstOrNull;
  }
}

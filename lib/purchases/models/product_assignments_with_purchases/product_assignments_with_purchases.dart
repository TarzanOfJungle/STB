import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:split_the_bill/purchases/models/product_purchase/product_purchase.dart';
import 'package:split_the_bill/purchases/models/product_shopping_assignment/product_shopping_assignment.dart';

part 'product_assignments_with_purchases.freezed.dart';

@Freezed(fromJson: false, toJson: false)
class ProductAssignmentsWithPurchases with _$ProductAssignmentsWithPurchases {
  const factory ProductAssignmentsWithPurchases({
    required List<ProductShoppingAssignment> productAssignments,
    required List<ProductPurchase> productPurchases,
  }) = _ProductAssignmentsWithPurchases;

  double get totalAmountSpent => productPurchases.fold(0, (previousValue, purchase) => previousValue + purchase.ammountSpent);
  int get totalItemsPurchased => productPurchases
      .fold(0, (previousValue, purchase) => previousValue + (purchase.quantityPurchased == purchase.totalQuantityToBePurchased ? 1 : 0));

  const ProductAssignmentsWithPurchases._();

  factory ProductAssignmentsWithPurchases.empty() =>
      const ProductAssignmentsWithPurchases(
          productAssignments: [], productPurchases: []);

  ProductPurchase? getProductPurchaseOfAssignment(
      ProductShoppingAssignment assignment) {
    final matching = productPurchases
        .where((purchase) => purchase.product.id == assignment.product.id);

    return matching.firstOrNull;
  }
}

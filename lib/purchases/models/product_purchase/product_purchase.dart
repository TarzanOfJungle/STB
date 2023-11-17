import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:split_the_bill/products/models/product/product.dart';
import 'package:split_the_bill/purchases/models/user_with_purchase_context/user_with_purchase_context.dart';

part 'product_purchase.freezed.dart';
part 'product_purchase.g.dart';

@freezed
class ProductPurchase with _$ProductPurchase {
  const factory ProductPurchase({
    required Product product,
    required int totalQuantityToBePurchased,
    required List<UserWithPurchaseContext> userPurchases,
  }) = _ProductPurchase;

  double get ammountSpent => userPurchases.fold(0,
      (previousValue, purchaser) => previousValue + purchaser.ammountPurchased);

  const ProductPurchase._();

  factory ProductPurchase.fromJson(Map<String, Object?> json) =>
      _$ProductPurchaseFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:split_the_bill/products/models/product/product.dart';

part 'product_with_purchase_context.freezed.dart';
part 'product_with_purchase_context.g.dart';
@freezed
class ProductWithPurchaseContext with _$ProductWithPurchaseContext {

  const factory ProductWithPurchaseContext({
    required Product product,
    required int quantity,
    required double unitPrice,
}) = _ProductWithPurchaseContext;

  double get totalAmountSpent => unitPrice * quantity;

  const ProductWithPurchaseContext._();

  factory ProductWithPurchaseContext.fromJson(Map<String, Object?> json) =>
      _$ProductWithPurchaseContextFromJson(json);
}
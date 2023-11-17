import 'package:freezed_annotation/freezed_annotation.dart';

part 'put_product_purchase.freezed.dart';
part 'put_product_purchase.g.dart';

/// DTO for creating/updating purchase of product for the given shopping.
/// If the purchase doesn't exist yet, it is created. If the given purchase
/// already exists, the quantity and unit price are updated accordingly.
/// 
/// Keep in mind, that a valid assignment between product and shopping must
/// exist ([ProductShoppingAssignment]) before purchasing.
@freezed
class PutProductPurchase with _$PutProductPurchase {
  const factory PutProductPurchase({
    required int shoppingId,
    required int productId,
    required int quantity,
    required double unitPrice,
  }) = _PutProductPurchase;

  const PutProductPurchase._();
  
  factory PutProductPurchase.fromJson(Map<String, Object?> json)
      => _$PutProductPurchaseFromJson(json);
}
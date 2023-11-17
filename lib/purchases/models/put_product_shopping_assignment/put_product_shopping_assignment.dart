import 'package:freezed_annotation/freezed_annotation.dart';

part 'put_product_shopping_assignment.freezed.dart';
part 'put_product_shopping_assignment.g.dart';

/// DTO for putting a new assignment of product (or updating
/// the quantity of an existing one if already exists) to shopping.
/// API automatically creates the product, if product with the 
/// specified name does't exist.
@freezed
class PutProductShoppingAssignment with _$PutProductShoppingAssignment {
  const factory PutProductShoppingAssignment({
    required int shoppingId,
    required String productName,
    required int quantity,
  }) = _PutProductShoppingAssignment;

  const PutProductShoppingAssignment._();
  
  factory PutProductShoppingAssignment.fromJson(Map<String, Object?> json)
      => _$PutProductShoppingAssignmentFromJson(json);
}
import 'package:freezed_annotation/freezed_annotation.dart';

part 'put_product_shopping_assignment.freezed.dart';
part 'put_product_shopping_assignment.g.dart';

/// DTO for  updating the quantity of an existing shopping assignment.
@freezed
class PutProductShoppingAssignment with _$PutProductShoppingAssignment {
  const factory PutProductShoppingAssignment({
    required int shoppingId,
    required int productId,
    required int quantity,
  }) = _PutProductShoppingAssignment;

  const PutProductShoppingAssignment._();
  
  factory PutProductShoppingAssignment.fromJson(Map<String, Object?> json)
      => _$PutProductShoppingAssignmentFromJson(json);
}
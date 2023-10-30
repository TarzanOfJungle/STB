import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:split_the_bill/model/product/product.dart';

part 'product_shopping_assignment.freezed.dart';
part 'product_shopping_assignment.g.dart';

@freezed
class ProductShoppingAssignment with _$ProductShoppingAssignment {
  const factory ProductShoppingAssignment({
    required Product product,
    required int quantity,
  }) = _ProductShoppingAssignment;

  const ProductShoppingAssignment._();
  
  factory ProductShoppingAssignment.fromJson(Map<String, Object?> json)
      => _$ProductShoppingAssignmentFromJson(json);
}
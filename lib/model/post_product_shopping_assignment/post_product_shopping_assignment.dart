import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_product_shopping_assignment.freezed.dart';
part 'post_product_shopping_assignment.g.dart';

@freezed
class PostProductShoppingAssignment with _$PostProductShoppingAssignment {
  const factory PostProductShoppingAssignment({
    required int shoppingId,
    required String productName,
    required int quantity,
  }) = _PostProductShoppingAssignment;

  const PostProductShoppingAssignment._();
  
  factory PostProductShoppingAssignment.fromJson(Map<String, Object?> json)
      => _$PostProductShoppingAssignmentFromJson(json);
}
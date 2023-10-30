import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:split_the_bill/shopping_detail/models/shopping/shopping.dart';

part 'shopping_with_context.freezed.dart';
part 'shopping_with_context.g.dart';

/// A conveinience wrapper for shopping - contains some
/// additional summary data for the given shopping.
@freezed
class ShoppingWithContext with _$ShoppingWithContext {
  const factory ShoppingWithContext({
    required Shopping shopping,
    required int numberOfItems,
    required double ammountSpent,
    required int numberOfParticipants,
  }) = _ShoppingWithContext;

  const ShoppingWithContext._();
  
  factory ShoppingWithContext.fromJson(Map<String, Object?> json)
      => _$ShoppingWithContextFromJson(json);
}
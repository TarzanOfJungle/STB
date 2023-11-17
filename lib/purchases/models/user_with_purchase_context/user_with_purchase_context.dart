import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:split_the_bill/users/models/user/user.dart';

part 'user_with_purchase_context.freezed.dart';
part 'user_with_purchase_context.g.dart';

@freezed
class UserWithPurchaseContext with _$UserWithPurchaseContext {
  const factory UserWithPurchaseContext({
    required User user,
    required int quantity,
    required double unitPrice,
  }) = _UserWithPurchaseContext;
  
  double get ammountPurchased => quantity * unitPrice;

  const UserWithPurchaseContext._();

  factory UserWithPurchaseContext.fromJson(Map<String, Object?> json) =>
      _$UserWithPurchaseContextFromJson(json);

}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:split_the_bill/users/models/user/user.dart';

part 'user_shopping_assignment.freezed.dart';
part 'user_shopping_assignment.g.dart';

/// Represents a user asigned to a given shopping
@freezed
class UserShoppingAssignment with _$UserShoppingAssignment {
  const factory UserShoppingAssignment({
    required int shoppingId,
    required User user,
  }) = _UserShoppingAssignment;

  const UserShoppingAssignment._();
  
  factory UserShoppingAssignment.fromJson(Map<String, Object?> json)
      => _$UserShoppingAssignmentFromJson(json);
}
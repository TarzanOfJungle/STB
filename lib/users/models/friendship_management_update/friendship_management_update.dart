import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:split_the_bill/users/models/user/user.dart';

part 'friendship_management_update.freezed.dart';
part 'friendship_management_update.g.dart';

/// DTO of received update of friendship/friendship request.
/// from the updates socket stream.
@freezed
class FriendshipManagementUpdate with _$FriendshipManagementUpdate {
  const factory FriendshipManagementUpdate({
    required User applicant,
    required User acceptant,
  }) = _FriendshipManagementUpdate;

  const FriendshipManagementUpdate._();
  
  factory FriendshipManagementUpdate.fromJson(Map<String, Object?> json)
      => _$FriendshipManagementUpdateFromJson(json);
}
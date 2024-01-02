import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_friendship_request_status.freezed.dart';
part 'update_friendship_request_status.g.dart';

/// A DTO for updating status of Pending(1) friendship
/// request between an applicant and the acceptant.
/// ONLY THE ACCEPTANT user can update the request status.
@freezed
class UpdateFriendshipRequestStatus with _$UpdateFriendshipRequestStatus {
  const factory UpdateFriendshipRequestStatus({
    required int applicantId,
    required int acceptantId,
    required bool accept,
  }) = _UpdateFriendshipRequestStatus;

  const UpdateFriendshipRequestStatus._();

  factory UpdateFriendshipRequestStatus.fromJson(Map<String, Object?> json) =>
      _$UpdateFriendshipRequestStatusFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:split_the_bill/users/models/friendship_request_status.dart';
import 'package:split_the_bill/users/models/user/user.dart';

part 'friendship_request.freezed.dart';
part 'friendship_request.g.dart';

/// Model representing a friendship request requested by [applicant]
/// user to the [acceptant] user. The friendship request can be in
/// one of the followind states:
/// * Accepted(0) = acceptant has already accepted the request
/// * Pending(1) = acceptant hasn't responded yet to the request
/// * Rejected(2) = acceptant has declined the request for friendship
@freezed
class FriendshipRequest with _$FriendshipRequest {
  const factory FriendshipRequest({
    required User applicant,
    required User acceptant,
    required FriendshipRequestStatus status,
  }) = _FriendshipRequest;

  const FriendshipRequest._();

  factory FriendshipRequest.fromJson(Map<String, Object?> json) =>
      _$FriendshipRequestFromJson(json);
}

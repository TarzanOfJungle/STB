import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_friendship_request.freezed.dart';
part 'post_friendship_request.g.dart';

/// DTO for posting a new friendship request
@freezed
class PostFriendshipRequest with _$PostFriendshipRequest {
  const factory PostFriendshipRequest({
    required int applicantId,
    required int acceptantId,
  }) = _PostFriendshipRequest;

  const PostFriendshipRequest._();
  
  factory PostFriendshipRequest.fromJson(Map<String, Object?> json)
      => _$PostFriendshipRequestFromJson(json);
}
import 'package:freezed_annotation/freezed_annotation.dart';

enum FriendshipRequestStatus{
  @JsonValue(0) ACCEPTED(0),
  @JsonValue(1) PENDING(1),
  @JsonValue(2) REJECTED(2);

  final int statusCode;
  const FriendshipRequestStatus(this.statusCode);
}
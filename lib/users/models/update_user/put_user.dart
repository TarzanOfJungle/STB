import 'package:freezed_annotation/freezed_annotation.dart';

part 'put_user.freezed.dart';
part 'put_user.g.dart';

/// DTO for updating a user with PUT.
/// non-null fields (except for id)
/// will be updated after sending to API.
@freezed
class PutUser with _$PutUser {
  const factory PutUser({
    required int id,
    String? email,
    String? username,
    String? password,
  }) = _PutUser;

  const PutUser._();
  
  factory PutUser.fromJson(Map<String, Object?> json)
      => _$PutUserFromJson(json);
}
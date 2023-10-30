import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_login.freezed.dart';
part 'post_login.g.dart';

/// DTO for posting a login request
@freezed
class PostLogin with _$PostLogin {
  const factory PostLogin({
    required String email,
    required String password,
  }) = _PostLogin;

  const PostLogin._();

  factory PostLogin.fromJson(Map<String, Object?> json)
      => _$PostLoginFromJson(json);
}
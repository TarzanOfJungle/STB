import 'package:freezed_annotation/freezed_annotation.dart';

part 'authenticated_user.freezed.dart';
part 'authenticated_user.g.dart';

@freezed
class AuthenticatedUser with _$AuthenticatedUser {
  const factory AuthenticatedUser({
    required int id,
    required String email,
    required String username,
    required String token,
    DateTime? created,
    DateTime? updated
  }) = _AuthenticatedUser;

  const AuthenticatedUser._();
  
  factory AuthenticatedUser.fromJson(Map<String, Object?> json)
      => _$AuthenticatedUserFromJson(json);
}
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:split_the_bill/users/models/user/user.dart';

part 'authenticated_user.freezed.dart';
part 'authenticated_user.g.dart';

/// User after logging in. Contains authentication token
@freezed
class AuthenticatedUser with _$AuthenticatedUser {
  const factory AuthenticatedUser(
      {required int id,
      required String email,
      required String username,
      required String token,
      DateTime? created,
      DateTime? updated}) = _AuthenticatedUser;

  const AuthenticatedUser._();

  factory AuthenticatedUser.fromJson(Map<String, Object?> json) =>
      _$AuthenticatedUserFromJson(json);

  User asUser() {
    return User(
      id: id,
      email: email,
      username: username,
      created: created,
      updated: updated,
    );
  }
}

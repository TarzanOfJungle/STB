import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:split_the_bill/users/models/user/user.dart';

part 'authenticated_user.freezed.dart';
part 'authenticated_user.g.dart';

/// User after logging in. Contains authentication token
@freezed
@HiveType(typeId: 0)
class AuthenticatedUser with _$AuthenticatedUser {
  const factory AuthenticatedUser({
    @HiveField(1) required int id,
    @HiveField(2) required String email,
    @HiveField(3) required String username,
    @HiveField(4) required String token,
    @HiveField(5) DateTime? created,
    @HiveField(6) DateTime? updated,
  }) = _AuthenticatedUser;

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

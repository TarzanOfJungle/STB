import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_user.freezed.dart';
part 'update_user.g.dart';

@freezed
class UpdateUser with _$UpdateUser {
  const factory UpdateUser({
    required int id,
    String? email,
    String? username,
    String? password,
  }) = _UpdateUser;

  const UpdateUser._();
  
  factory UpdateUser.fromJson(Map<String, Object?> json)
      => _$UpdateUserFromJson(json);
}
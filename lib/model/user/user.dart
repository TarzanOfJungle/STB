
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String email,
    required String username,
    DateTime? created,
    DateTime? updated
  }) = _User;

  const User._();
  
  factory User.fromJson(Map<String, Object?> json)
      => _$UserFromJson(json);
}
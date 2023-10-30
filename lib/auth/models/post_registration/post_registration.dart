import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_registration.freezed.dart';
part 'post_registration.g.dart';

/// DTO for posting a new user registration request
@freezed
class PostRegistration with _$PostRegistration {
  const factory PostRegistration({
    required String email,
    required String username,
    required String password,
  }) = _PostRegistration;

  const PostRegistration._();
  
  factory PostRegistration.fromJson(Map<String, Object?> json)
      => _$PostRegistrationFromJson(json);
}
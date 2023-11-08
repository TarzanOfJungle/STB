import 'package:split_the_bill/auth/models/authenticated_user/authenticated_user.dart';
import 'package:split_the_bill/auth/models/post_login/post_login.dart';
import 'package:split_the_bill/auth/models/post_registration/post_registration.dart';
import 'package:split_the_bill/users/models/user/user.dart';

abstract class AuthRepositoryBase {
  Future<AuthenticatedUser> logIn(PostLogin postLogin);
  Future<User> register(PostRegistration postRegistration);
  Future<bool> isAccessTokenValid(String token);
}

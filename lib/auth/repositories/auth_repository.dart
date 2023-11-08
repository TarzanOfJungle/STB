import 'package:split_the_bill/auth/models/authenticated_user/authenticated_user.dart';
import 'package:split_the_bill/auth/models/post_login/post_login.dart';
import 'package:split_the_bill/auth/models/post_registration/post_registration.dart';
import 'package:split_the_bill/auth/repositories/auth_repository_base.dart';
import 'package:split_the_bill/common/api/api_exception.dart';
import 'package:split_the_bill/common/api/api_client_base.dart';
import 'package:split_the_bill/common/api/http_method.dart';
import 'package:split_the_bill/common/constants/api_constants.dart';
import 'package:split_the_bill/users/models/user/user.dart';

class AuthRepository implements AuthRepositoryBase {
  final ApiClientBase _apiClient;

  const AuthRepository(this._apiClient);

  @override
  Future<bool> isAccessTokenValid(String token) async {
    try {
      await _apiClient.sendRequest(
        path: ApiConstants.tokenValidation,
        method: HttpMethod.get,
        notifyErrorListeners: false,
      );
    } on ApiClientUnauthorizedException catch (_) {
      return false;
    }
    return true;
  }

  @override
  Future<AuthenticatedUser> logIn(PostLogin postLogin) async {
    final loggedInUser = await _apiClient.sendDataRequest(
      path: ApiConstants.login,
      method: HttpMethod.post,
      useAuthentication: false,
      jsonBody: postLogin.toJson(),
      processBody: AuthenticatedUser.fromJson,
    );
    return loggedInUser;
  }

  @override
  Future<User> register(PostRegistration postRegistration) async {
    final newUser = await _apiClient.sendDataRequest(
      path: ApiConstants.registration,
      method: HttpMethod.post,
      useAuthentication: false,
      jsonBody: postRegistration.toJson(),
      processBody: User.fromJson,
    );
    return newUser;
  }
}

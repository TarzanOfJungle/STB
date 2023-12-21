import 'package:split_the_bill/auth/models/authenticated_user/authenticated_user.dart';
import 'package:split_the_bill/auth/models/post_login/post_login.dart';
import 'package:split_the_bill/auth/models/post_registration/post_registration.dart';
import 'package:split_the_bill/auth/repositories/auth_repository_base.dart';
import 'package:split_the_bill/common/api/api_exception.dart';
import 'package:split_the_bill/common/api/api_client_base.dart';
import 'package:split_the_bill/common/api/http_method.dart';
import 'package:split_the_bill/common/config/hive/hive_constants.dart';
import 'package:split_the_bill/common/config/hive/hive_utils.dart';
import 'package:split_the_bill/common/constants/api_constants.dart';
import 'package:split_the_bill/common/extensions/json_string_extension.dart';
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
        useAuthentication: false,
        additionalHeaders: {
          "Authorization": "Bearer $token"
        }
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
      processBody: (rawBody) {
        final userJson = rawBody.asJsonObject();
        return AuthenticatedUser.fromJson(userJson);
      },
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
      processBody: (rawBody) {
        final userJson = rawBody.asJsonObject();
        return User.fromJson(userJson);
      },
    );
    return newUser;
  }

  @override
  Future<AuthenticatedUser?> getLastLoggedInUser() async {
    AuthenticatedUser? lastLoggedInUser;
    await HiveUtils.doInBoxScope<AuthenticatedUser>(
      boxKey: HiveConstants.AUTHENTICATED_USERS_BOX_KEY,
      boxScope: (box) async {
        lastLoggedInUser = box.get(HiveConstants.LAST_LOGGED_IN_USER_KEY);
      },
    );
    return lastLoggedInUser;
  }

  @override
  Future<void> saveLastLoggedInUser(AuthenticatedUser user) async {
    await HiveUtils.doInBoxScope(
      boxKey: HiveConstants.AUTHENTICATED_USERS_BOX_KEY,
      boxScope: (box) async {
        box.put(HiveConstants.LAST_LOGGED_IN_USER_KEY, user);
      },
    );
  }

  @override
  Future<void> deleteLastLoggedInUser() async {
    await HiveUtils.doInBoxScope(
      boxKey: HiveConstants.AUTHENTICATED_USERS_BOX_KEY,
      boxScope: (box) async {
        box.delete(HiveConstants.LAST_LOGGED_IN_USER_KEY);
      },
    );
  }
}

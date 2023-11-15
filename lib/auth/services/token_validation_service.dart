import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/auth/repositories/auth_repository_base.dart';
import 'package:split_the_bill/common/api/api_client_base.dart';
import 'package:split_the_bill/common/api/api_exception.dart';

/// This service makes sure that user is automatically logged out
/// when his/her access token expires.
class TokenValidationService {
  late final AuthController _authController;
  late final ApiClientBase _apiClient;
  late final AuthRepositoryBase _authRepository;

  String? get _token => _authController.loggedInUser?.token;

  TokenValidationService({
    required AuthController authController,
    required ApiClientBase apiClient,
    required AuthRepositoryBase authRepository,
  }) {
    _authController = authController;
    _apiClient = apiClient;
    _authRepository = authRepository;

    _apiClient.addErrorListener(_handleUnauthorizedErrors);
  }

  /// In case any of the requests return an unauthorized status,
  /// auth controller should check if user's token is still valid
  /// and log him out if not.
  void _handleUnauthorizedErrors(ApiException exception) {
    if (exception is ApiClientUnauthorizedException) {
      _validateUserToken();
    }
  }

  Future<void> _validateUserToken() async {
    final token = _token;
    if(token == null){
      return;
    }
    try {
      final tokenValid =
          await _authRepository.isAccessTokenValid(token);
      if (!tokenValid) {
        _authController.logout();
      }
    } catch (_) {
      // can't validate user token (no connectivity or server problem) - no action
    }
  }
}

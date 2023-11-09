import 'package:split_the_bill/auth/models/authenticated_user/authenticated_user.dart';
import 'package:split_the_bill/auth/models/post_login/post_login.dart';
import 'package:split_the_bill/auth/repositories/auth_repository_base.dart';
import 'package:split_the_bill/common/api/api_exception.dart';
import 'package:split_the_bill/common/api/api_client_base.dart';
import 'package:rxdart/rxdart.dart';

class AuthController {
  final BehaviorSubject<AuthenticatedUser?> _loggedInUser =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<String?> _errorMessage = BehaviorSubject.seeded(null);
  final BehaviorSubject<bool> _isLoading = BehaviorSubject.seeded(false);

  late final ApiClientBase _apiClient;
  late final AuthRepositoryBase _authRepository;

  Stream<AuthenticatedUser?> get loggedInUserStream => _loggedInUser.stream;
  AuthenticatedUser? get loggedInUser => _loggedInUser.value;
  Stream<bool> get isLoadingStream => _isLoading.stream;
  Stream<String?> get errorMessageStream => _errorMessage.stream;

  AuthController({
    required ApiClientBase client,
    required AuthRepositoryBase authRepository,
  }) {
    _apiClient = client;
    _authRepository = authRepository;

    _apiClient.addErrorListener(_handleUnauthorizedErrors);
  }

  Future<void> login(PostLogin loginData) async {
    _errorMessage.add(null);
    _isLoading.add(true);
    try {
      final user = await _authRepository.logIn(loginData);
      _setLoggedInUser(user);
    } on ApiClientException catch (_) {
      _errorMessage.add("Invalid credentials");
    } on ApiServerException catch (_) {
      _errorMessage.add("Sorry, something went wrong on our servers");
    } catch (_) {
      _errorMessage.add("Something went wrong");
    } finally {
      _isLoading.add(false);
    }
  }

  void logout() {
    _setLoggedInUser(null);
  }

  void clearError() {
    if (_errorMessage.hasValue) {
      _errorMessage.add(null);
    }
  }

  void _setLoggedInUser(AuthenticatedUser? newUser) {
    _loggedInUser.add(newUser);
    _apiClient.setToken(newUser?.token);
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
    try {
      final tokenValid =
          await _authRepository.isAccessTokenValid(loggedInUser!.token);
      if (!tokenValid) {
        logout();
      }
    } catch (_) {
      // user continues offline
    }
  }
}

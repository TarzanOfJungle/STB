  import 'package:split_the_bill/auth/models/authenticated_user/authenticated_user.dart';
import 'package:split_the_bill/auth/models/post_login/post_login.dart';
import 'package:split_the_bill/auth/models/post_registration/post_registration.dart';
import 'package:split_the_bill/auth/repositories/auth_repository_base.dart';
import 'package:split_the_bill/common/api/api_exception.dart';
import 'package:split_the_bill/common/api/api_client_base.dart';
import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/common/controllers/snackbar_messanger_controller.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message_category.dart';

const _INVALID_CREDENTIALS_MESSAGE = "Invalid credentials";
const _EMAIL_CONFLICT_MESSAGE = "This e-mail is already taken";
const _API_SERVER_EXCEPTION_MESSAGE =
    "Sorry, something went wrong on our servers";
const _API_DEFAULT_EXCEPTION_MESSAGE = "Something went wrong";

class AuthController {
  final BehaviorSubject<AuthenticatedUser?> _loggedInUser =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<bool> _isLoading = BehaviorSubject.seeded(false);
  late final ApiClientBase _apiClient;
  late final SnackbarMessangerController _snackbarController;
  late final AuthRepositoryBase _authRepository;

  AuthController({
    required ApiClientBase client,
    required AuthRepositoryBase authRepository,
    required SnackbarMessangerController snackbarMessangerController,
  }) {
    _apiClient = client;
    _authRepository = authRepository;
    _snackbarController = snackbarMessangerController;
  }

  Stream<AuthenticatedUser?> get loggedInUserStream => _loggedInUser.stream;
  AuthenticatedUser? get loggedInUser => _loggedInUser.value;
  Stream<bool> get isLoadingStream => _isLoading.stream;

  /// Attempts to log user in
  /// Returns true if login was successful, false otherwise
  Future<bool> login(PostLogin loginData) async {
    if (_isLoading.value) {
      return false;
    }
    _isLoading.add(true);
    var wasSuccess = false;
    try {
      final user = await _authRepository.logIn(loginData);
      _setLoggedInUser(user);
      wasSuccess = true;
    } on ApiClientException catch (_) {
      _showError(_INVALID_CREDENTIALS_MESSAGE);
    } on ApiServerException catch (_) {
      _showError(_API_SERVER_EXCEPTION_MESSAGE);
    } catch (_) {
      _showError(_API_DEFAULT_EXCEPTION_MESSAGE);
    }
    _isLoading.add(false);
    return wasSuccess;
  }

  /// Attempts to register a new user and then log him in immediately
  /// Returns true if both registration and login were successful, false otherwise
  Future<bool> register(PostRegistration registrationData) async {
    if (_isLoading.value) {
      return false;
    }
    _isLoading.add(true);
    var wasSuccess = false;
    try {
      await _authRepository.register(registrationData);
      final loginData = PostLogin(
        email: registrationData.email,
        password: registrationData.password,
      );
      wasSuccess = await login(loginData);
    } on ApiServerException catch (_) {
      _showError(_API_SERVER_EXCEPTION_MESSAGE);
    } on ApiException catch (ex) {
      if (ex.code == 409) {
        _showError(_EMAIL_CONFLICT_MESSAGE);
      } else {
        _showError(_API_DEFAULT_EXCEPTION_MESSAGE);
      }
    } catch (_) {
      _showError(_API_DEFAULT_EXCEPTION_MESSAGE);
    }
    _isLoading.add(false);
    return wasSuccess;
  }

  void logout() {
    if (loggedInUser != null) {
      _setLoggedInUser(null);
    }
  }

  void _setLoggedInUser(AuthenticatedUser? newUser) {
    _loggedInUser.add(newUser);
    _apiClient.setToken(newUser?.token);
  }

  void _showError(String errorMessage) {
    final message = SnackbarMessage(
      message: errorMessage,
      category: SnackbarMessageCategory.ERROR,
    );
    _snackbarController.showSnackbarMessage(message);
  }
}

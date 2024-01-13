import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/common/mixins/authenticated_socket_observer.dart';
import 'package:split_the_bill/users/models/update_user/put_user.dart';
import 'package:split_the_bill/users/repositories/users_repository_base.dart';

import '../../common/controllers/snackbar_messanger_controller.dart';
import '../../common/models/snackbar_message/snackbar_message.dart';
import '../../common/models/snackbar_message/snackbar_message_category.dart';
import '../../users/models/user/user.dart';

const _UPDATE_FAILED_MESSAGE =
    "Unable to update parameters, try again later.";

const _USER_LOADING_ERROR_MESSAGE = "Unable to load user informations";

class ProfileController with AuthenticatedSocketObserver {
  final _userInformations = BehaviorSubject<User?>.seeded(null);
  final UsersRepositoryBase _usersRepository;
  final AuthController _authController;
  final SnackbarMessangerController _snackbarController;

  ProfileController(
    this._usersRepository,
    this._authController,
    this._snackbarController,
  );

  Stream<User?> get userInformationsStream => _userInformations.stream;

  Future<void> refreshUserInformations() async{
    final loggedInUserId = _authController.loggedInUser?.id;
    if (loggedInUserId != null) {
      try {
        final user = await _usersRepository.getUserById(loggedInUserId);
        _userInformations.add(user);
      } catch (_) {
        _userInformations.add(null);
        _showError(_USER_LOADING_ERROR_MESSAGE);
      }
    }
  }
  Future<bool> updateUser(PutUser putUser) async {
    var wasSuccess = false;
    try {
      await _usersRepository.updateUser(putUser);
      refreshUserInformations();
      wasSuccess = true;
    } catch (_) {
      _showError(_UPDATE_FAILED_MESSAGE);
    }
    return wasSuccess;
  }

  void _showError(String errorMessage) {
    final message = SnackbarMessage(
      message: errorMessage,
      category: SnackbarMessageCategory.ERROR,
    );
    _snackbarController.showSnackbarMessage(message);
  }
}

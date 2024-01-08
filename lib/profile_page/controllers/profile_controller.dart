import 'package:split_the_bill/common/mixins/authenticated_socket_observer.dart';
import 'package:split_the_bill/users/models/update_user/put_user.dart';
import 'package:split_the_bill/users/repositories/users_repository_base.dart';

import '../../common/controllers/snackbar_messanger_controller.dart';
import '../../common/models/snackbar_message/snackbar_message.dart';
import '../../common/models/snackbar_message/snackbar_message_category.dart';

const String _UPDATE_FAILED_MESSAGE = "Unable to update parameters, try again later.";
class ProfileController with AuthenticatedSocketObserver{
  final UsersRepositoryBase _usersRepository;
  final SnackbarMessangerController _snackbarController;

  ProfileController(
    this._usersRepository,
    this._snackbarController,
  ) {
    _listenForProfileChanges();
  }

  void _listenForProfileChanges() {
    observeSocketEvents(
      eventStream: _usersRepository.getUserShoppingAssignmentChangesStream,
      onValueChanged: (assignmentEvent) {
        updateProfile();
      },
    );
  }

  Future<bool> updateProfile() async {
    var wasSuccess = false;

    return wasSuccess;
  }

  Future<bool> updateUser(PutUser putUser) async {
    var wasSuccess = false;
    try {
      await _usersRepository.updateUser(putUser);
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

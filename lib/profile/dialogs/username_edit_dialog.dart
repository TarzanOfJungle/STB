import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/controllers/snackbar_messanger_controller.dart';
import 'package:split_the_bill/common/utils/validator.dart';
import 'package:split_the_bill/common/widgets/dialogs/stb_dialog.dart';
import 'package:split_the_bill/common/widgets/wrappers/stream_builder_with_handling.dart';
import 'package:split_the_bill/profile/controllers/profile_controller.dart';
import 'package:split_the_bill/users/models/update_user/put_user.dart';

import '../../common/models/snackbar_message/snackbar_message.dart';
import '../../common/models/snackbar_message/snackbar_message_category.dart';
import '../../common/navigation/nav_router.dart';
import '../../common/widgets/components/stb_elevated_button.dart';
import '../../common/widgets/components/stb_text_field.dart';
import '../../ioc_container.dart';
import '../../users/models/user/user.dart';

const _TITLE = "Edit username";
const _USERNAME_EDIT_ERROR_MESSAGE = "Cannot change username";

class UsernameEditDialog extends StatefulWidget {
  final User user;

  const UsernameEditDialog({
    super.key,
    required this.user,
  });

  @override
  State<UsernameEditDialog> createState() => _UsernameEditDialogState();
}

class _UsernameEditDialogState extends State<UsernameEditDialog> {
  final _navRouter = get<NavRouter>();
  final _profileController = get<ProfileController>();
  final _snackbarController = get<SnackbarMessangerController>();
  final _usernameController = TextEditingController();
  final _registrationFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return StbDialog(
      title: _TITLE,
      titleIcon: Icons.edit,
      body: Column(
        children: [
          StreamBuilderWithHandling(
            stream: _profileController.userInformationsStream,
            buildWhenData: (context, data) {
                _usernameController.text = data!.username;
                return Form(
                  key: _registrationFormKey,
                  child: StbTextField(
                    controller: _usernameController,
                    label: "New username",
                    validator: (value) => Validator.validateUsername(value),
                  ),
                );
              }
          ),
          const SizedBox(
            height: 20.0,
          ),
          _buildButtons(),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StbElevatedButton(
          text: 'Cancel',
          stretch: true,
          onTap: () => _navRouter.returnBack(),
          color: UiConstants.infoColor,
        ),
        StbElevatedButton(
          text: 'Confirm',
          stretch: true,
          onTap: () async {
            final wasChanged = await _onConfirm();
            if (wasChanged) {
              _navRouter.returnBack();
            }
          },
          color: UiConstants.confirmColor,
        )
      ],
    );
  }

  Future<bool> _onConfirm() async {
    var wasSuccess = false;
    if (_registrationFormKey.currentState!.validate()) {
      final post = PutUser(
        id: widget.user.id,
        username: _usernameController.text,
      );
      wasSuccess = await _profileController.updateUser(post);
      if (!wasSuccess) {
        _showMessage(_USERNAME_EDIT_ERROR_MESSAGE, SnackbarMessageCategory.ERROR);
      }
    }
    return wasSuccess;
  }

  void _showMessage(String errorMessage, SnackbarMessageCategory category) {
    final message = SnackbarMessage(
      message: errorMessage,
      category: SnackbarMessageCategory.WARNING,
    );
    _snackbarController.showSnackbarMessage(message);
  }
}

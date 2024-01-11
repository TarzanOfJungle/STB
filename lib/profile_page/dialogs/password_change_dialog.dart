import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/controllers/snackbar_messanger_controller.dart';
import 'package:split_the_bill/common/utils/validator.dart';
import 'package:split_the_bill/profile_page/controllers/profile_controller.dart';

import '../../common/models/snackbar_message/snackbar_message.dart';
import '../../common/models/snackbar_message/snackbar_message_category.dart';
import '../../common/navigation/nav_router.dart';
import '../../common/widgets/components/stb_elevated_button.dart';
import '../../common/widgets/components/stb_text_field.dart';
import '../../common/widgets/dialogs/stb_dialog.dart';
import '../../ioc_container.dart';
import '../../users/models/update_user/put_user.dart';
import '../../users/models/user/user.dart';

const _TITLE = "Change password";

const _CHANGE_FAILED_MASSEGE = "Unable to change password";

class PasswordChangeDialog extends StatefulWidget {
  final User user;

  const PasswordChangeDialog({super.key, required this.user});

  @override
  State<PasswordChangeDialog> createState() => _PasswordChangeDialogState();
}

class _PasswordChangeDialogState extends State<PasswordChangeDialog> {
  final _navRouter = get<NavRouter>();
  final _profileController = get<ProfileController>();
  final _snackbarController = get<SnackbarMessangerController>();
  final _passwordController = TextEditingController();
  final _confirmationController = TextEditingController();
  final _registrationFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return StbDialog(
      title: _TITLE,
      titleIcon: Icons.edit,
      body: Form(
        key: _registrationFormKey,
        child: Column(
          children: [
            StbTextField(
              controller: _passwordController,
              label: 'New password',
              obscureText: true,
              validator: (value) => Validator.validatePassword(value),
            ),
            const SizedBox(
              height: STANDARD_PADDING,
            ),
            StbTextField(
              controller: _confirmationController,
              label: 'Confirm Password',
              obscureText: true,
              validator: (value) => Validator.validatePassword(value),
            ),
            const SizedBox(
              height: STANDARD_PADDING,
            ),
            _buildButtons(),
          ],
        ),
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
            var wasSuccess = await _onConfirm();
            if (wasSuccess) {
              _showMessage('Password changed', SnackbarMessageCategory.INFO);
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
      if (_passwordController.text != _confirmationController.text) {
        _showMessage('Password must match', SnackbarMessageCategory.WARNING);
        _confirmationController.clear();
        return false;
      }
      var post = PutUser(
        id: widget.user.id,
        password: _passwordController.text,
      );
      wasSuccess = await _profileController.updateUser(post);
      if (!wasSuccess) {
        _showMessage(_CHANGE_FAILED_MASSEGE, SnackbarMessageCategory.ERROR);
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

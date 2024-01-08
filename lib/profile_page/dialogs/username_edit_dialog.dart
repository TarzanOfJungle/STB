import 'package:flutter/material.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/auth/models/authenticated_user/authenticated_user.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/widgets/dialogs/stb_dialog.dart';
import 'package:split_the_bill/common/widgets/loading_indicator.dart';
import 'package:split_the_bill/profile_page/controllers/profile_controller.dart';
import 'package:split_the_bill/users/models/update_user/put_user.dart';

import '../../common/navigation/nav_router.dart';
import '../../common/widgets/components/stb_elevated_button.dart';
import '../../common/widgets/components/stb_text_field.dart';
import '../../ioc_container.dart';
import '../../users/models/user/user.dart';

const String _TITLE = "Edit username";

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
  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StbDialog(
      title: _TITLE,
      titleIcon: Icons.edit,
      body: Column(
        children: [
          StreamBuilder(
            stream: _profileController.userInformationsStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString(),),);
              } else if (!snapshot.hasData) {
                return const Center(child: LoadingIndicator(),);
              } else {
                _usernameController.text = snapshot.data!.username;
                return StbTextField(
                  controller: _usernameController,
                  label: "New username",
                  maxLength: 500,
                );
              }
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
          onTap: () {
            _onConfirm();
            _navRouter.returnBack();
          },
          color: UiConstants.confirmColor,
        )
      ],
    );
  }

  Future<void> _onConfirm() async {
    if (_usernameController.text.isNotEmpty &&
        _usernameController.text.trim() != "") {
      var wasSuccess = false;
      var post = PutUser(
        id: widget.user.id,
        username: _usernameController.text,
      );
      wasSuccess = await _profileController.updateUser(post);
      if (!wasSuccess) {
        // TODO do something
      }
    }
  }
}

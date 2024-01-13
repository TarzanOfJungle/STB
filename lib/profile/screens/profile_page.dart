import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/widgets/components/stb_icon_appbar_button.dart';
import 'package:split_the_bill/common/widgets/page_template.dart';
import 'package:split_the_bill/common/widgets/wrappers/stream_builder_with_handling.dart';
import 'package:split_the_bill/profile/controllers/profile_controller.dart';
import 'package:split_the_bill/profile/dialogs/password_change_dialog.dart';
import 'package:split_the_bill/profile/dialogs/username_edit_dialog.dart';
import 'package:split_the_bill/profile/widgets/profile_tile.dart';

import '../../auth/controllers/auth_controller.dart';
import '../../common/navigation/nav_router.dart';
import '../../common/widgets/dialogs/confirmation_dialog.dart';
import '../../ioc_container.dart';
import '../../users/models/user/user.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final _authController = get<AuthController>();
  final _profileController = get<ProfileController>();
  final _navRouter = get<NavRouter>();

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      label: 'Profile',
      showBackButton: true,
      actions: [
        StbIconAppbarButton(
          onPressed: () => _onLogoutButtonPressed(context),
          iconData: Icons.logout,
        ),
      ],
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(STANDARD_PADDING),
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    _profileController.refreshUserInformations();
    return StreamBuilderWithHandling(
      stream: _profileController.userInformationsStream,
      buildWhenData: (context, data) {
        final user = data!;
        return Column(
          children: [
            _buildEmailTile(user),
            const SizedBox(
              height: SMALL_PADDING,
            ),
            _buildUsernameTile(context, user),
            const SizedBox(
              height: SMALL_PADDING,
            ),
            _buildPasswordTile(context, user),
          ],
        );
      },
    );
  }

  Widget _buildUsernameTile(BuildContext context, User user) {
    return ProfileTile(
      label: 'Username',
      displayedValue: user.username,
      onEdit: () => _onEditButtonPressed(context, user),
    );
  }

  Widget _buildEmailTile(User user) {
    return ProfileTile(
      label: 'E-mail',
      displayedValue: user.email,
      showEditButton: false,
      onEdit: () {},
    );
  }

  Widget _buildPasswordTile(BuildContext context, User user) {
    return ProfileTile(
      label: 'Password',
      onEdit: () => _onChangePasswordPressed(context, user),
      buttonLabel: 'Change password',
    );
  }

  void _onLogoutButtonPressed(context) {
    showDialog(
      context: context,
      builder: (context) => ConfirmationDialog(
          label: 'Do you want to logout?', onConfirm: _logout),
    );
  }

  Future<void> _logout() async {
    await _authController.logout();
    _navRouter.toLogin();
  }

  void _onEditButtonPressed(context, User user) {
    showDialog(
      context: context,
      builder: (context) => UsernameEditDialog(
        user: user,
      ),
    );
  }

  void _onChangePasswordPressed(context, User user) {
    showDialog(
      context: context,
      builder: (context) => PasswordChangeDialog(
        user: user,
      ),
    );
  }
}

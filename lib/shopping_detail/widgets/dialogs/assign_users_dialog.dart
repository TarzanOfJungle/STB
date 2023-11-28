import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/common/widgets/components/animated_lookup_list.dart';
import 'package:split_the_bill/common/widgets/components/stb_elevated_button.dart';
import 'package:split_the_bill/common/widgets/components/stb_text_field.dart';
import 'package:split_the_bill/common/widgets/dialogs/stb_dialog.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/shopping_detail/controllers/assign_users_controller.dart';
import 'package:split_the_bill/shopping_detail/widgets/user_to_assign_chip.dart';
import 'package:split_the_bill/users/models/user/user.dart';

const _LOOKUP_HEIGHT = 150.0;

class AssignUsersDialog extends StatefulWidget {
  const AssignUsersDialog({super.key});

  @override
  State<AssignUsersDialog> createState() => _AssignUsersDialogState();
}

class _AssignUsersDialogState extends State<AssignUsersDialog> {
  final TextEditingController _userTextEditingController =
      TextEditingController();

  final _assignUsersController = get<AssignUsersController>();
  final _navRouter = get<NavRouter>();

  @override
  void initState() {
    _assignUsersController.resetState();
    super.initState();
  }

  @override
  void dispose() {
    _assignUsersController.resetState();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StbDialog(
      title: "Add users",
      titleIcon: Icons.person_add_rounded,
      body: StreamBuilder(
        stream: _assignUsersController.usersToAddStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return const SizedBox.shrink();
          }
          final usersToAdd = snapshot.data!;
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUsersToAddList(usersToAdd),
              const SizedBox(height: SMALL_PADDING),
              _buildUserTextField(),
              _buildUsersLookup(),
              const SizedBox(height: STANDARD_PADDING),
              _buildAssignButton(usersToAdd),
            ],
          );
        },
      ),
    );
  }

  Widget _buildUsersToAddList(List<User> usersToAdd) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...usersToAdd.map(
            (user) => UserToAssignChip(
              user: user,
              onCancel: () => _assignUsersController.removeUser(user),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserTextField() {
    return StbTextField(
      controller: _userTextEditingController,
      label: "User",
      enableSuggestions: true,
      onChanged: (value) {
        _assignUsersController.setUsersSearchQuery(value);
      },
    );
  }

  Widget _buildUsersLookup() {
    return StreamBuilder(
      stream: _assignUsersController.usersLookupStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.hasError) {
          return const SizedBox.shrink();
        }
        final lookupUsers = snapshot.data!;
        return AnimatedLookupList(
          isShown: lookupUsers.isNotEmpty,
          items: lookupUsers,
          heightWhenShown: _LOOKUP_HEIGHT,
          onItemSelected: (value) {
            _assignUsersController.addUser(value);
            _assignUsersController.setUsersSearchQuery(null);
            _emptyTextField();
          },
          itemIcon: Icons.person_add_rounded,
          getItemTitle: (value) => value.username,
          getItemSubtitle: (value) => value.email,
        );
      },
    );
  }

  Widget _buildAssignButton(List<User> usersToAdd) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StbElevatedButton(
            text: "Add selected users",
            enabled: usersToAdd.isNotEmpty,
            leadingIcon: Icons.person_add_rounded,
            onTap: () async {
              final success = await _assignUsersController.addSelectedUsers();
              if (success) {
                _navRouter.returnBack();
              }
            }),
      ],
    );
  }

  void _emptyTextField() {
    _userTextEditingController.text = "";
  }
}

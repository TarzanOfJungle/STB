import 'package:flutter/material.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/widgets/components/animated_lookup_list.dart';
import 'package:split_the_bill/common/widgets/components/stb_elevated_button.dart';
import 'package:split_the_bill/common/widgets/components/stb_text_field.dart';
import 'package:split_the_bill/common/widgets/dialogs/confirmation_dialog.dart';
import 'package:split_the_bill/common/widgets/page_template.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/shopping_detail/controllers/shopping_members_controller.dart';
import 'package:split_the_bill/shopping_detail/widgets/shopping_member_list_tile.dart';
import 'package:split_the_bill/shopping_detail/widgets/user_to_assign_chip.dart';
import 'package:split_the_bill/users/models/user/user.dart';

const _TITLE_ICONS_SIZE = 30.0;
const _LOOKUP_HEIGHT = 150.0;

class ShoppingMembersPage extends StatefulWidget {
  const ShoppingMembersPage({super.key});

  @override
  State<ShoppingMembersPage> createState() => _ShoppingMembersPageState();
}

class _ShoppingMembersPageState extends State<ShoppingMembersPage> {
  final TextEditingController _userTextEditingController =
      TextEditingController();

  final _authController = get<AuthController>();
  final _membersController = get<ShoppingMembersController>();

  @override
  void initState() {
    _membersController.resetUserAssignment();
    super.initState();
  }

  @override
  void dispose() {
    _membersController.resetUserAssignment();
    _userTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      label: "Members",
      showBackButton: true,
      child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: STANDARD_PADDING, horizontal: 30.0),
        child: Column(
          children: [
            _buildAssignNewUsersSection(context),
            const SizedBox(height: 30.0),
            _buildMembersList(context),
          ],
        ),
      )),
    );
  }

  Widget _buildAssignNewUsersSection(BuildContext context) {
    return StreamBuilder(
      stream: _membersController.usersToAddStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.hasError) {
          return const SizedBox.shrink();
        }
        final usersToAdd = snapshot.data!;
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeadline(
              context: context,
              text: "Add users",
              icon: Icons.person_add_rounded,
            ),
            const SizedBox(height: SMALL_PADDING),
            _buildUsersToAddList(usersToAdd),
            const SizedBox(height: SMALL_PADDING),
            StbTextField(
              controller: _userTextEditingController,
              label: "User",
              enableSuggestions: true,
              onChanged: (value) {
                _membersController.setUsersSearchQuery(value);
              },
            ),
            _buildUsersLookup(),
            const SizedBox(height: STANDARD_PADDING),
            _buildAssignButton(usersToAdd),
          ],
        );
      },
    );
  }

  Widget _buildMembersList(BuildContext context) {
    return StreamBuilder(
        stream: _membersController.shoppingMembersStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return const SizedBox.shrink();
          }
          final currentUserId = _authController.loggedInUser!.id;
          final currentMembers = snapshot.data!;
          final currentUserIsCreator =
              currentUserId == _membersController.shoppingCreatorId;
          return Column(
            children: [
              _buildHeadline(
                context: context,
                text: "Current members",
                icon: Icons.person_rounded,
              ),
              const SizedBox(height: SMALL_PADDING),
              ...currentMembers.map((user) => ShoppingMemberListTile(
                    user: user,
                    currentUserId: currentUserId,
                    onDelete: currentUserIsCreator
                        ? () => _showUnassignUserDialog(user)
                        : null,
                  ))
            ],
          );
        });
  }

  Widget _buildHeadline({
    required BuildContext context,
    required String text,
    required IconData icon,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: _TITLE_ICONS_SIZE,
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ],
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
              onCancel: () => _membersController.removeUser(user),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUsersLookup() {
    return StreamBuilder(
      stream: _membersController.usersLookupStream,
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
            _membersController.addUser(value);
            _membersController.setUsersSearchQuery(null);
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
        Visibility(
          visible: usersToAdd.isNotEmpty,
          child: StbElevatedButton(
            text: "Add selected users",
            leadingIcon: Icons.person_add_rounded,
            onTap: () {
              _membersController.addSelectedUsers();
            },
          ),
        ),
      ],
    );
  }

  void _showUnassignUserDialog(User userToUnassign) {
    showDialog(
      context: context,
      builder: (context) => ConfirmationDialog(
        label: "Unassign user",
        description:
            "Are you sure you want to unassign ${userToUnassign.username}? All of this user's purchases on this shopping will be canceled.",
        onConfirm: () => _membersController.unassignUser(userToUnassign),
      ),
    );
  }

  void _emptyTextField() {
    _userTextEditingController.text = "";
  }
}

import 'package:flutter/material.dart';
import 'package:split_the_bill/common/widgets/components/stb_text_field.dart';
import 'package:split_the_bill/common/widgets/dialogs/stb_dialog.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/shopping_detail/controllers/assign_users_controller.dart';

class AssignUsersDialog extends StatefulWidget {
  const AssignUsersDialog({super.key});

  @override
  State<AssignUsersDialog> createState() => _AssignUsersDialogState();
}

class _AssignUsersDialogState extends State<AssignUsersDialog> {
  final TextEditingController _userTextEditingController =
      TextEditingController();

  final _assignUsersController = get<AssignUsersController>();

  @override
  Widget build(BuildContext context) {
    return StbDialog(
      title: "Assign users",
      titleIcon: Icons.person_add_rounded,
      body: StreamBuilder(
        stream: _assignUsersController.usersToAddStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return const SizedBox.shrink();
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildUserTextField()
            ],
          );
        },
      ),
    );
  }

  Widget _buildUserTextField() {
    return StbTextField(
      controller: _userTextEditingController,
      label: "User",
      enableSuggestions: true,
      onChanged: (value) {
        // TODO
      },
    );
  }
}

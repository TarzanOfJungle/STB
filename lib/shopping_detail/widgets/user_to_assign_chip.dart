import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/users/models/user/user.dart';

const _OUTER_PADDING = 3.0;
const _MAX_TEXT_WIDTH = 120.0;

class UserToAssignChip extends StatelessWidget {
  final User user;
  final VoidCallback onCancel;

  const UserToAssignChip({
    super.key,
    required this.user,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _OUTER_PADDING),
      child: Chip(
        shape: const StadiumBorder(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        deleteIcon: const Icon(Icons.close_rounded),
        deleteIconColor: UiConstants.deleteColor,
        onDeleted: onCancel,
        label: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: _MAX_TEXT_WIDTH),
          child: Column(
            children: [
              Text(
                user.username,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

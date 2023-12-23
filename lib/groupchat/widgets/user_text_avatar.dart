import 'package:flutter/material.dart';
import 'package:split_the_bill/users/models/user/user.dart';

const _AVATAR_LETTER_SIZE = 15.0;
const _AVATAR_INNER_PADDING = 10.0;

class UserTextAvatar extends StatelessWidget {
  final User? user;

  String get _avatarLetter {
    if (user == null || user!.username.isEmpty) {
      return "";
    }
    return user!.username.substring(0, 1).toUpperCase();
  }

  const UserTextAvatar({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(_AVATAR_INNER_PADDING),
      child: Text(
        _avatarLetter,
        style: TextStyle(
          fontSize: _AVATAR_LETTER_SIZE,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:split_the_bill/users/models/user/user.dart';

const _AVATAR_LETTER_DEFAULT_SIZE = 15.0;

class UserTextAvatar extends StatelessWidget {
  final User? user;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double letterSize;

  String get _avatarLetter {
    if (user == null || user!.username.isEmpty) {
      return "";
    }
    return user!.username.substring(0, 1).toUpperCase();
  }

  double get _avatarInnerPadding => letterSize * 0.75;

  const UserTextAvatar({
    super.key,
    required this.user,
    this.backgroundColor,
    this.foregroundColor,
    this.letterSize = _AVATAR_LETTER_DEFAULT_SIZE,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.surface,
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.all(_avatarInnerPadding),
      child: Text(
        _avatarLetter,
        style: TextStyle(
          fontSize: letterSize,
          color: foregroundColor ?? Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}

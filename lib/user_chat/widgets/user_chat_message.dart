import 'package:flutter/material.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/widgets/components/chat_message_text_bubble.dart';
import 'package:split_the_bill/common/widgets/components/user_text_avatar.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/user_chat/controllers/user_chat_controller.dart';
import 'package:split_the_bill/user_chat/models/user_chat_message_with_users.dart';

class UserChatMessage extends StatelessWidget {
  final UserChatMessageWithUsers messageWithUsers;
  final _authController = get<AuthController>();
  final _userChatController = get<UserChatController>();

  bool get _isLoggedInUsersMessage =>
      messageWithUsers.sender.id == _authController.loggedInUser?.id;

  MainAxisAlignment get _mainAxisAlignment =>
      _isLoggedInUsersMessage ? MainAxisAlignment.end : MainAxisAlignment.start;

  UserChatMessage({
    super.key,
    required this.messageWithUsers,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: UiConstants.chatMessageVerticalMargin,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: _mainAxisAlignment,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildUserAvatar(),
              ChatMessageTextBubble(
                message: messageWithUsers.message.message,
                isLoggedInUsersMessage: _isLoggedInUsersMessage,
                onMessageDelete: () =>
                    _userChatController.deleteMessage(messageWithUsers.message),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUserAvatar() {
    if (_isLoggedInUsersMessage) {
      return const SizedBox.shrink();
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        UserTextAvatar(user: messageWithUsers.sender),
        const SizedBox(width: 5)
      ],
    );
  }
}

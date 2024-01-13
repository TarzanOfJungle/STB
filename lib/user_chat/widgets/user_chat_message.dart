import 'package:flutter/material.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/extensions/datetime_convert_extension.dart';
import 'package:split_the_bill/common/widgets/components/chat_message_text_bubble.dart';
import 'package:split_the_bill/common/widgets/components/user_text_avatar.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/user_chat/controllers/user_chat_controller.dart';
import 'package:split_the_bill/user_chat/models/user_chat_message_with_users.dart';

class UserChatMessage extends StatelessWidget {
  final UserChatMessageWithUsers currentMessage;
  final UserChatMessageWithUsers? previousMessage;
  final _authController = get<AuthController>();
  final _userChatController = get<UserChatController>();

  bool get _isLoggedInUsersMessage =>
      currentMessage.sender.id == _authController.loggedInUser?.id;

  bool get _isFirstMessageInGroup =>
      currentMessage.sender.id != previousMessage?.sender.id;

  MainAxisAlignment get _mainAxisAlignment =>
      _isLoggedInUsersMessage ? MainAxisAlignment.end : MainAxisAlignment.start;

  UserChatMessage({
    super.key,
    required this.currentMessage,
    this.previousMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTimestamp(context),
        Padding(
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
                    message: currentMessage.message.message,
                    isLoggedInUsersMessage: _isLoggedInUsersMessage,
                    onMessageDelete: () => _userChatController
                        .deleteMessage(currentMessage.message),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUserAvatar() {
    if (_isLoggedInUsersMessage) {
      return const SizedBox.shrink();
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        UserTextAvatar(user: currentMessage.sender),
        const SizedBox(width: 5)
      ],
    );
  }

  Widget _buildTimestamp(BuildContext context) {
    if (!_isFirstMessageInGroup) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 3,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              currentMessage.message.created.toDateTimeString(),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ],
      ),
    );
  }
}

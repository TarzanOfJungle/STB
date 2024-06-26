import 'package:flutter/material.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/extensions/datetime_convert_extension.dart';
import 'package:split_the_bill/groupchat/controllers/groupchat_controller.dart';
import 'package:split_the_bill/groupchat/models/groupchat_message_with_author.dart';
import 'package:split_the_bill/common/widgets/components/chat_message_text_bubble.dart';
import 'package:split_the_bill/common/widgets/components/user_text_avatar.dart';
import 'package:split_the_bill/ioc_container.dart';

class GroupchatMessage extends StatelessWidget {
  final GroupchatMessageWithAuthor currentMessage;
  final GroupchatMessageWithAuthor? previousMessage;
  final _authController = get<AuthController>();
  final _groupchatController = get<GroupchatController>();

  bool get _isLoggedInUsersMessage =>
      currentMessage.author?.id == _authController.loggedInUser?.id;

  bool get _isFirstMessageInGroup =>
      currentMessage.author?.id != previousMessage?.author?.id;

  MainAxisAlignment get _mainAxisAlignment =>
      _isLoggedInUsersMessage ? MainAxisAlignment.end : MainAxisAlignment.start;

  GroupchatMessage({
    super.key,
    required this.currentMessage,
    required this.previousMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildLabel(context),
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
                    onMessageDelete: () => _groupchatController
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

  Widget _buildLabel(BuildContext context) {
    if (!_isFirstMessageInGroup || currentMessage.author == null) {
      return const SizedBox.shrink();
    }
    final username = currentMessage.author!.username;
    final timeStamp = currentMessage.message.created.toDateTimeString();

    return Padding(
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 3,
      ),
      child: Row(
        mainAxisAlignment: _mainAxisAlignment,
        children: [
          Flexible(
            child: Text(
              "$username ($timeStamp)",
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

  Widget _buildUserAvatar() {
    return Opacity(
      opacity: _isFirstMessageInGroup && !_isLoggedInUsersMessage ? 1.0 : 0.0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          UserTextAvatar(user: currentMessage.author),
          const SizedBox(width: 5)
        ],
      ),
    );
  }
}

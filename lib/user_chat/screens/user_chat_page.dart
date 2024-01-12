import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/widgets/empty_chat_banner.dart';
import 'package:split_the_bill/common/widgets/components/chat_input.dart';
import 'package:split_the_bill/common/widgets/page_template.dart';
import 'package:split_the_bill/common/widgets/wrappers/stream_builder_with_handling.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:split_the_bill/user_chat/controllers/user_chat_controller.dart';
import 'package:split_the_bill/user_chat/models/user_chat_message_with_users.dart';
import 'package:split_the_bill/user_chat/widgets/user_chat_message.dart';

class UserChatPage extends StatefulWidget {
  const UserChatPage({super.key});

  @override
  State<UserChatPage> createState() => _UserChatPageState();
}

class _UserChatPageState extends State<UserChatPage> {
  final _messageInputController = TextEditingController();
  final _scrollController = ScrollController();
  final _userChatController = get<UserChatController>();

  @override
  void dispose() {
    _messageInputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      label: _userChatController.otherUser?.username ?? "Chat",
      showBackButton: true,
      child: StreamBuilderWithHandling(
        stream: _userChatController.sortedMessagesWithUsersStream,
        buildWhenData: (context, messages) {
          WidgetsBinding.instance
              .addPostFrameCallback((_) => _scrollToBottom());

          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: _buildUserChatMessages(messages),
                ),
                _buildMessageInput(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildUserChatMessages(List<UserChatMessageWithUsers> messages) {
    if (messages.isEmpty) {
      return const EmptyChatBanner();
    }
    final messagesReversed = messages.reversed.toList();
    return ListView.builder(
      controller: _scrollController,
      reverse: true,
      padding: const EdgeInsets.only(
        left: STANDARD_PADDING,
        right: STANDARD_PADDING,
        top: STANDARD_PADDING,
      ),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final currentMessage = messagesReversed[index];
        final previousMessage = messagesReversed.elementAtOrNull(index + 1);
        return UserChatMessage(
          currentMessage: currentMessage,
          previousMessage: previousMessage,
        );
      },
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(STANDARD_PADDING),
      child: ChatInput(
        controller: _messageInputController,
        onMessageSent: () => _sendMessage(),
      ),
    );
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: UiConstants.autoscrollDuration,
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  Future<void> _sendMessage() async {
    final messageToSend = _messageInputController.text;
    _messageInputController.clear();
    final success = await _userChatController.postNewMessage(messageToSend);
    if (!success) {
      _messageInputController.text = messageToSend;
    }
  }
}

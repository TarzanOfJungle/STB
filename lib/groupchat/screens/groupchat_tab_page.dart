import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/widgets/empty_chat_banner.dart';
import 'package:split_the_bill/common/widgets/wrappers/stream_builder_with_handling.dart';
import 'package:split_the_bill/groupchat/controllers/groupchat_controller.dart';
import 'package:split_the_bill/groupchat/models/groupchat_message_with_author.dart';
import 'package:split_the_bill/common/widgets/components/chat_input.dart';
import 'package:split_the_bill/groupchat/widgets/groupchat_message.dart';
import 'package:split_the_bill/ioc_container.dart';

class GroupchatTabPage extends StatefulWidget {
  const GroupchatTabPage({super.key});

  @override
  State<GroupchatTabPage> createState() => _GroupchatTabPageState();
}

class _GroupchatTabPageState extends State<GroupchatTabPage> {
  final _messageInputController = TextEditingController();
  final _scrollController = ScrollController();
  final _groupchatController = get<GroupchatController>();

  @override
  void dispose() {
    _messageInputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilderWithHandling(
      stream: _groupchatController.sortedMessagesStream,
      buildWhenData: (context, messages) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());

        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: _buildMessagesList(messages),
              ),
              _buildMessageInput(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMessagesList(List<GroupchatMessageWithAuthor> messages) {
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
        return GroupchatMessage(
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
    if (messageToSend.isEmpty) return;
    _messageInputController.clear();
    final success = await _groupchatController.postNewMessage(messageToSend);
    if (!success) {
      _messageInputController.text = messageToSend;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:split_the_bill/common/widgets/dialogs/confirmation_dialog.dart';

const _MESSAGE_BUBBLE_PADDING = 10.0;
const _MESSAGE_BUBBLE_RADIUS = 15.0;

class ChatMessageTextBubble extends StatelessWidget {
  final String message;
  final bool isLoggedInUsersMessage;
  final VoidCallback onMessageDelete;

  const ChatMessageTextBubble({
    super.key,
    required this.message,
    required this.isLoggedInUsersMessage,
    required this.onMessageDelete,
  });

  @override
  Widget build(BuildContext context) {
    final boxColor = isLoggedInUsersMessage
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.surface;
    final textColor = isLoggedInUsersMessage
        ? Theme.of(context).colorScheme.onPrimary
        : Theme.of(context).colorScheme.onSurface;

    return GestureDetector(
      onLongPress: () {
        if (isLoggedInUsersMessage) {
          _showDeleteConfirmationDialog(context);
        }
      },
      child: Container(
        constraints: BoxConstraints(
          maxWidth: _getMessageMaxWidth(context),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_MESSAGE_BUBBLE_RADIUS),
          color: boxColor,
        ),
        padding: const EdgeInsets.all(_MESSAGE_BUBBLE_PADDING),
        child: Text(
          message,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }

  double _getMessageMaxWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * 0.6;
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ConfirmationDialog(
        label: "Delete message",
        description: "Are you sure you want to delete this message?",
        onConfirm: () async => onMessageDelete(),
      ),
    );
  }
}

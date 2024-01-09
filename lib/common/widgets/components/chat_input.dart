import 'package:flutter/material.dart';

const _MAX_INPUT_LINES = 4;

class ChatInput extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onMessageSent;

  const ChatInput({
    super.key,
    required this.controller,
    required this.onMessageSent,
  });

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: TextField(
            controller: widget.controller,
            minLines: 1,
            maxLines: _MAX_INPUT_LINES,
            focusNode: _focusNode,
            onTapOutside: (_) => _focusNode.unfocus(),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: widget.onMessageSent,
          style: ElevatedButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.onSecondary,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            shape: const StadiumBorder(),
          ),
          child: const Icon(Icons.send_rounded),
        )
      ],
    );
  }
}

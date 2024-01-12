import 'package:flutter/material.dart';

const _MESSAGE = "There are no messages here yet.";
const _ICON_SIZE = 50.0;

class EmptyChatBanner extends StatelessWidget {
  final String text;
  const EmptyChatBanner({
    super.key,
    this.text = _MESSAGE,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        const Icon(Icons.chat_rounded, size: _ICON_SIZE),
        Text(text),
        const Spacer(),
      ],
    );
  }
}

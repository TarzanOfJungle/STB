import 'package:flutter/material.dart';

const _TITLE_ICON_SIZE = 35.0;

class StbDialog extends StatelessWidget {
  final String title;
  final IconData titleIcon;
  final Widget body;

  const StbDialog({
    super.key,
    required this.title,
    required this.titleIcon,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 25,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTitle(context),
            const SizedBox(height: 25),
            body,
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          titleIcon,
          size: _TITLE_ICON_SIZE,
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ],
    );
  }
}

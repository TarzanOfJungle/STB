import 'package:flutter/material.dart';

class StbTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  const StbTextButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size.zero,
        padding: const EdgeInsets.all(0),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: color ?? Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}

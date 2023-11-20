import 'package:flutter/material.dart';

class IconButtonWithBackground extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color? backgroundColor;
  final Color? iconColor;

  const IconButtonWithBackground({
    super.key,
    required this.onTap,
    required this.icon,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.7,
      child: IconButton(
        onPressed: onTap,
        style: IconButton.styleFrom(
          backgroundColor:
              backgroundColor ?? Theme.of(context).colorScheme.secondary,
        ),
        padding: EdgeInsets.zero,
        icon: Icon(
          icon,
          color: iconColor ?? Theme.of(context).colorScheme.onSecondary,
        ),
      ),
    );
  }
}

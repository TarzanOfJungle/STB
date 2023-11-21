import 'package:flutter/material.dart';

class IconButtonWithBackground extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final double scale;
  final Color? backgroundColor;
  final Color? iconColor;

  const IconButtonWithBackground(
      {super.key,
      required this.onTap,
      required this.icon,
      this.backgroundColor,
      this.iconColor,
      this.scale = 0.6});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: IconButton(
        onPressed: onTap,
        style: IconButton.styleFrom(
            backgroundColor:
                backgroundColor ?? Theme.of(context).colorScheme.secondary,
            foregroundColor:
                iconColor ?? Theme.of(context).colorScheme.onSecondary),
        padding: EdgeInsets.zero,
        icon: Icon(icon),
      ),
    );
  }
}

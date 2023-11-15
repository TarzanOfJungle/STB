import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const AppBarButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}

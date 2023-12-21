import 'package:flutter/material.dart';

class ButtonRowItem {
  final Widget buttonChild;
  final Color? backgroundColor;
  final bool enabled;
  final VoidCallback onTap;

  ButtonRowItem({
    required this.buttonChild, 
    required this.onTap,
    this.enabled = true,
    this.backgroundColor,
  });
}

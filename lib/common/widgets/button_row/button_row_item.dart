import 'package:flutter/material.dart';

class ButtonRowItem {
  final Widget buttonChild;
  final Color? backgroundColor;
  final VoidCallback onTap;

  ButtonRowItem({
    required this.buttonChild, 
    required this.onTap,
    this.backgroundColor,
  });
}

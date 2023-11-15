import 'package:flutter/cupertino.dart';

class NavbarItem {
  final String label;
  final Icon icon;
  final Widget child;

  const NavbarItem({
    required this.label,
    required this.icon,
    required this.child,
  });
}
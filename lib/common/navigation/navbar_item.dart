import 'package:flutter/material.dart';

class NavbarItem {
  final String label;
  final IconData icon;

  const NavbarItem({
    required this.label,
    required this.icon,
  });

  static const List<NavbarItem> items = [
    NavbarItem(label: 'Home', icon: Icons.home_rounded),
    NavbarItem(label: 'Shoppings', icon: Icons.shopping_cart_rounded),
    NavbarItem(label: 'Friends', icon: Icons.people_alt_rounded),
  ];
}

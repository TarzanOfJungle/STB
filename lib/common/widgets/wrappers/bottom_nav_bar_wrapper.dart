import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:split_the_bill/common/navigation/navbar_item.dart';

class BottomNavBarWrapper extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavBarWrapper({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) {
          final goToInitialLocation = index == navigationShell.currentIndex;
          navigationShell.goBranch(
            index,
            initialLocation: goToInitialLocation,
          );
        },
        items: NavbarItem.items
            .map(
              (navItem) => BottomNavigationBarItem(
                label: navItem.label,
                icon: Icon(navItem.icon),
              ),
            )
            .toList(),
      ),
    );
  }
}

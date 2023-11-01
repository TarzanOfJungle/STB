import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/navbar_options.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';

import '../../ioc_container.dart';

class NavbarPageWrapper extends StatefulWidget {
  final int? initialIndex;
  final Widget? child;

  const NavbarPageWrapper({super.key, this.initialIndex, this.child});

  @override
  State<NavbarPageWrapper> createState() => _NavbarPageWrapperState();
}

class _NavbarPageWrapperState extends State<NavbarPageWrapper> {
  final _navRouter = get<NavRouter>();
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.child != null ? -1 : (widget.initialIndex ?? 0);
  }

  void _onItemTapped(int index) {
    // _navRouter.push(context, NavbarPageWrapper(initialIndex: index,));
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == -1
          ? widget.child!
          : NavbarOptions.navbarOptions
              .map((item) => item.child)
              .toList()[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: NavbarOptions.navbarOptions
            .map((item) =>
                BottomNavigationBarItem(label: item.label, icon: item.icon))
            .toList(),
        currentIndex: _selectedIndex == -1 ? 0 : _selectedIndex,
        // TODO selectedItemColor from theme and check for -1 index than nothing is selected
        // selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

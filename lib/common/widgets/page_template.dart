import 'package:flutter/material.dart';

class PageTemplate extends StatelessWidget {
  final String label;
  final Widget child;
  final List<Widget> actions = [];
  PageTemplate({super.key, required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(label),
        actions: actions,
      ),
      body: child,
    );
  }
}

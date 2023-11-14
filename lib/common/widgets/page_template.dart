import 'package:flutter/material.dart';

class PageTemplate extends StatelessWidget {
  final String label;
  final Widget child;
  final List<Widget>? actions;

  const PageTemplate(
      {super.key, required this.label, required this.child, this.actions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(label),
        actions: actions,
      ),
      body: SafeArea(
        child: child,
      ),
    );
  }
}

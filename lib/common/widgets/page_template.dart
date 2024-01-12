import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/ioc_container.dart';

class PageTemplate extends StatelessWidget {
  final String label;
  final Widget child;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? bottom;
  final bool showBackButton;
  final List<Widget>? actions;

  final _navRouter = get<NavRouter>();

  PageTemplate({
    super.key,
    required this.label,
    required this.child,
    this.floatingActionButton,
    this.bottom,
    this.showBackButton = false,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(label),
        actions: actions != null
            ? [
                ...actions!,
                const SizedBox(
                  width: STANDARD_PADDING,
                )
              ]
            : null,
        leading: _buildBackButton(),
        bottom: bottom,
      ),
      floatingActionButton: floatingActionButton,
      body: SafeArea(
        child: child,
      ),
    );
  }

  Widget? _buildBackButton() {
    if (!showBackButton) {
      return null;
    }
    return IconButton(
      onPressed: () => _navRouter.returnBack(),
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
    );
  }
}

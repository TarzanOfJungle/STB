import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/common/widgets/page_template.dart';
import 'package:split_the_bill/ioc_container.dart';

class HomePage extends StatelessWidget {
  final _navRouter = get<NavRouter>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      label: 'Home',
      actions: [
        IconButton.outlined(
          onPressed: () => _navRouter.toProfile(),
          icon: const Icon(Icons.person),
        ),
        const SizedBox(
          width: STANDARD_PADDING,
        )
      ],
      child: const Center(
        child: Text('home page TBD'),
      ),
    );
  }
}

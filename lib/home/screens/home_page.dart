import 'package:flutter/material.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/ioc_container.dart';

class HomePage extends StatelessWidget {
  final _authController = get<AuthController>();
  final _navRouter = get<NavRouter>();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _authController.logout();
            _navRouter.toLogin();
          },
          child: const Text("logout"),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/ioc_container.dart';

class HomePage extends StatelessWidget {
  final _authController = get<AuthController>();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => _authController.logout(),
          child: const Text("logout"),
        ),
      ),
    );
  }
}
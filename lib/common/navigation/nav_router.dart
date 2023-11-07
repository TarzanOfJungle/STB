import 'package:flutter/material.dart';
import 'package:split_the_bill/auth/screens/login_screen.dart';

class NavRouter {
  void returnBack(BuildContext context) {
    Navigator.pop(context);
  }

  Future<void> toLogin(BuildContext context) {
    return Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }

  Future<void> toRegistration(BuildContext context) {
    return Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:split_the_bill/auth/screens/login_screen.dart';

class NavRouter {
  void returnBack(BuildContext context) {
    Navigator.pop(context);
  }

  void push(BuildContext context, Widget nextPage) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => nextPage));
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

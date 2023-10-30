import 'package:flutter/cupertino.dart';
import 'package:split_the_bill/common/constants/nav_routes.dart';

class NavRouter {
  void returnBack(BuildContext context) {
    Navigator.pop(context);
  }

  Future<void> toLogin(BuildContext context) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
      NavRoutes.loginScreen,
      (route) => false,
    );
  }

  Future<void> toRegistration(BuildContext context) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
      NavRoutes.registrationScreen,
      (route) => false,
    );
  }
}
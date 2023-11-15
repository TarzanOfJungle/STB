import 'package:flutter/material.dart';
import 'package:split_the_bill/auth/screens/login_screen.dart';
import 'package:split_the_bill/auth/screens/registration_screen.dart';
import 'package:split_the_bill/common/constants/nav_routes.dart';
import 'package:split_the_bill/common/widgets/navbar_page_wrapper.dart';
import 'package:split_the_bill/home/screens/home_screen.dart';

class NavRouter {
  final GlobalKey<NavigatorState> _navigatorKey;

  const NavRouter(this._navigatorKey);

  NavigatorState get _navigator => _navigatorKey.currentState!;

  static Map<String, WidgetBuilder> routes = {
    NavRoutes.login: (context) => const LoginScreen(),
    NavRoutes.registration: (context) => const RegistrationScreen(),
    NavRoutes.home: (context) => HomeScreen(),
    NavRoutes.shoppingList: (context) => const NavbarPageWrapper(),
  };

  void returnBack() {
    _navigator.pop();
  }

  void push(BuildContext context, Widget nextPage) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => nextPage));
  }

  Future<void> toLogin() {
    return _navigator.pushNamedAndRemoveUntil(
      NavRoutes.login,
      (route) => false,
    );
  }

  Future<void> toRegistration() {
    return _navigator.pushNamedAndRemoveUntil(
      NavRoutes.registration,
      (route) => false,
    );
  }

  Future<void> navigateOnLoginSuccess() {
    return _navigator.pushNamedAndRemoveUntil(
      NavRoutes.shoppingList,
      (route) => false,
    );
  }
}

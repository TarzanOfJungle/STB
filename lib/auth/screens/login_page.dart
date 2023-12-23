import 'package:flutter/material.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/auth/models/post_login/post_login.dart';
import 'package:split_the_bill/auth/widgets/auth_button/auth_button.dart';
import 'package:split_the_bill/auth/widgets/auth_screen_template.dart';
import 'package:split_the_bill/auth/widgets/login_banner.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/common/utils/validator.dart';
import 'package:split_the_bill/common/widgets/components/stb_text_button.dart';
import 'package:split_the_bill/common/widgets/components/stb_text_field.dart';
import 'package:split_the_bill/ioc_container.dart';

const _NO_ACCOUNT_YET_TEXT = "Don't have an account yet?";
const _NO_INTERNET_MESSAGE = "You need an internet connection to log in";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _authController = get<AuthController>();
  final _navRouter = get<NavRouter>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    _restorePreviousUser();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return AuthScreenTemplate(
      formKey: _loginFormKey,
      banner: const LoginBanner(),
      title: "Login",
      formFields: [
        StbTextField(
          controller: _emailController,
          label: "E-mail",
          keyboardType: TextInputType.emailAddress,
          validator: (value) => Validator.validateEmail(value),
        ),
        const SizedBox(height: 10),
        StbTextField(
          controller: _passwordController,
          label: "Password",
          validator: (value) => Validator.validatePassword(value),
          obscureText: true,
        ),
      ],
      confirmButton: AuthButton(
        title: "Log in",
        noInternetMessage: _NO_INTERNET_MESSAGE,
        icon: Icons.person_rounded,
        onTap: () => _login(),
      ),
      appendix: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(_NO_ACCOUNT_YET_TEXT),
          const SizedBox(width: 10),
          StbTextButton(
            text: "Sign up",
            onTap: () => _navRouter.toRegistration(),
          ),
        ],
      ),
    );
  }

  Future<void> _restorePreviousUser() async {
    final success = await _authController.tryToRecoverLastUser();
    if (success) {
      _navRouter.toHome();
    }
  }

  Future<void> _login() async {
    final isValid = _loginFormKey.currentState!.validate();
    if (isValid) {
      final loginData = PostLogin(
        email: _emailController.text,
        password: _passwordController.text,
      );
      final success = await _authController.login(loginData);
      if (success) {
        _navRouter.toHome();
      } else {
        _emptyPassword();
      }
    }
  }

  void _emptyPassword() {
    _passwordController.text = "";
  }
}

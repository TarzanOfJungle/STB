import 'package:flutter/material.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/auth/models/post_login/post_login.dart';
import 'package:split_the_bill/auth/widgets/auth_screen_template.dart';
import 'package:split_the_bill/auth/widgets/login_banner.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/common/utils/validator.dart';
import 'package:split_the_bill/common/widgets/loading_indicator.dart';
import 'package:split_the_bill/common/widgets/stb_elevated_button.dart';
import 'package:split_the_bill/common/widgets/stb_text_button.dart';
import 'package:split_the_bill/common/widgets/stb_text_field.dart';
import 'package:split_the_bill/ioc_container.dart';

const _NO_ACCOUNT_YET_TEXT = "Don't have an account yet?";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _authController = get<AuthController>();
  final _navRouter = get<NavRouter>();

  final _emailController = TextEditingController(text: "");
  final _passwordController = TextEditingController(text: "");
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AuthScreenTemplate(
      formKey: _loginFormKey,
      banner: const LoginBanner(),
      title: "Login",
      formFields: [
        StbTextField(
          controller: _emailController,
          hint: "E-mail",
          keyboardType: TextInputType.emailAddress,
          validator: (value) => Validator.validateEmail(value),
        ),
        const SizedBox(height: 10),
        StbTextField(
          controller: _passwordController,
          hint: "Password",
          validator: (value) => Validator.validatePassword(value),
          obscureText: true,
        ),
      ],
      confirmButton: _buildLoginButton(),
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

  Widget _buildLoginButton() {
    return StreamBuilder<bool>(
      stream: _authController.isLoadingStream,
      builder: (_, loading) {
        final isLoading = !loading.hasError && loading.hasData && loading.data!;
        return Visibility(
          visible: !isLoading,
          replacement: const LoadingIndicator(),
          child: StbElevatedButton(
            text: "Log in",
            leadingIcon: Icons.login_rounded,
            onTap: () => _login(),
          ),
        );
      },
    );
  }

  Future<void> _login() async {
    final isValid = _loginFormKey.currentState!.validate();
    if (isValid) {
      final loginData = PostLogin(
        email: _emailController.text,
        password: _passwordController.text,
      );
      final success = await _authController.login(loginData);
      if(success) {
        _navRouter.navigateOnLoginSuccess();
      } else {
        _emptyPassword();
      }
    }
  }

  void _emptyPassword() {
    _passwordController.text = "";
  }
}

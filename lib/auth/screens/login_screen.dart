import 'package:flutter/material.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/auth/models/post_login/post_login.dart';
import 'package:split_the_bill/auth/widgets/login_banner.dart';
import 'package:split_the_bill/common/utils/validator.dart';
import 'package:split_the_bill/common/widgets/loading_indicator.dart';
import 'package:split_the_bill/common/widgets/stb_elevated_button.dart';
import 'package:split_the_bill/common/widgets/stb_text_field.dart';
import 'package:split_the_bill/ioc_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _authController = get<AuthController>();
  final _emailController = TextEditingController(text: "");
  final _passwordController = TextEditingController(text: "");
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _listenForLoginSuccess();
    _listenForErrors();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const LoginBanner(),
                Text(
                  "Login",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                StbTextField(
                  controller: _emailController,
                  hint: "E-mail",
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateEmail,
                  onTap: () => _authController.clearError(),
                ),
                const SizedBox(height: 10),
                StbTextField(
                  controller: _passwordController,
                  hint: "Password",
                  validator: _validatePassword,
                  obscureText: true,
                  onTap: () => _authController.clearError(),
                ),
                _buildErrorMessage(),
                const SizedBox(
                  height: 15,
                ),
                _buildLoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _listenForLoginSuccess() {
    _authController.loggedInUserStream.listen((user) {
      if (user != null) {
        // TODO: go to the home screen
      }
    });
  }

  void _listenForErrors() {
    _authController.errorMessageStream.listen(
      (error) {
        if (error != null) {
          _emptyPassword();
        }
      },
    );
  }

  Widget _buildErrorMessage() {
    return StreamBuilder<String?>(
      stream: _authController.errorMessageStream,
      builder: (_, errorMessage) {
        if (errorMessage.hasData && errorMessage.data != null) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Text(
              errorMessage.data!,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        return const SizedBox.shrink();
      },
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

  void _login() {
    final isValid = _loginFormKey.currentState!.validate();
    if (isValid) {
      final loginData = PostLogin(
        email: _emailController.text,
        password: _passwordController.text,
      );
      _authController.login(loginData);
    }
  }

  void _emptyPassword() {
    _passwordController.text = "";
  }

  String? _validateEmail(String? email) {
    final toValidate = email ?? "";
    final isValid = Validator.validateEmail(toValidate);
    return isValid ? null : "Invalid e-mail";
  }

  String? _validatePassword(String? password) {
    final toValidate = password ?? "";
    final isValid = Validator.validatePassword(toValidate);
    return isValid
        ? null
        : "Password must be at least ${Validator.MIN_PASSWORD_LENGTH} characters long";
  }
}

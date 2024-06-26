import 'package:flutter/material.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/auth/models/post_registration/post_registration.dart';
import 'package:split_the_bill/auth/widgets/auth_button/auth_button.dart';
import 'package:split_the_bill/auth/widgets/auth_screen_template.dart';
import 'package:split_the_bill/auth/widgets/registration_banner.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/common/utils/validator.dart';
import 'package:split_the_bill/common/widgets/components/stb_text_button.dart';
import 'package:split_the_bill/common/widgets/components/stb_text_field.dart';
import 'package:split_the_bill/ioc_container.dart';

const _ALREADY_HAVE_ACCOUNT_TEXT = "Already have an account?";
const _NO_INTERNET_MESSAGE = "You need an internet connection to sign up";

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _authController = get<AuthController>();
  final _navRouter = get<NavRouter>();

  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _registrationFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthScreenTemplate(
      formKey: _registrationFormKey,
      banner: const RegistrationBanner(),
      title: "Registration",
      formFields: [
        StbTextField(
          controller: _usernameController,
          label: "Username",
          validator: (value) => Validator.validateUsername(value),
        ),
        const SizedBox(height: 10),
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
        title: "Sign up",
        noInternetMessage: _NO_INTERNET_MESSAGE,
        icon: Icons.upload_file_rounded,
        onTap: () => _register(),

      ),
      appendix: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(_ALREADY_HAVE_ACCOUNT_TEXT),
          const SizedBox(width: 10),
          StbTextButton(
            text: "Log in",
            onTap: () => _navRouter.toLogin(),
          ),
        ],
      ),
    );
  }

  Future<void> _register() async {
    final isValid = _registrationFormKey.currentState!.validate();
    if (isValid) {
      final registrationData = PostRegistration(
        username: _usernameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );
      final success = await _authController.register(registrationData);
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

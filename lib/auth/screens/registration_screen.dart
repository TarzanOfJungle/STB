import 'package:flutter/material.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/auth/models/post_registration/post_registration.dart';
import 'package:split_the_bill/auth/widgets/auth_screen_template.dart';
import 'package:split_the_bill/auth/widgets/registration_banner.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/common/utils/validator.dart';
import 'package:split_the_bill/common/widgets/loading_indicator.dart';
import 'package:split_the_bill/common/widgets/stb_elevated_button.dart';
import 'package:split_the_bill/common/widgets/stb_text_button.dart';
import 'package:split_the_bill/common/widgets/stb_text_field.dart';
import 'package:split_the_bill/ioc_container.dart';

const _ALREADY_HAVE_ACCOUNT_TEXT = "Already have an account?";

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _authController = get<AuthController>();
  final _navRouter = get<NavRouter>();

  final _emailController = TextEditingController(text: "");
  final _usernameController = TextEditingController(text: "");
  final _passwordController = TextEditingController(text: "");
  final _registrationFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _listenForRegistrationSuccess();

    return AuthScreenTemplate(
      formKey: _registrationFormKey,
      banner: const RegistrationBanner(),
      title: "Registration",
      formFields: [
        StbTextField(
          controller: _usernameController,
          hint: "Username",
          validator: (value) => Validator.validateUsername(value),
        ),
        const SizedBox(height: 10),
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
      confirmButton: _buildRegistrationButton(),
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

  void _listenForRegistrationSuccess() {
    _authController.loggedInUserStream.listen((user) {
      if (user != null) {
        _navRouter.navigateOnLoginSuccess();
      }
    });
  }

  Widget _buildRegistrationButton() {
    return StreamBuilder<bool>(
      stream: _authController.isLoadingStream,
      builder: (_, loading) {
        final isLoading = !loading.hasError && loading.hasData && loading.data!;
        return Visibility(
          visible: !isLoading,
          replacement: const LoadingIndicator(),
          child: StbElevatedButton(
            text: "Sign up",
            leadingIcon: Icons.upload_file_rounded,
            onTap: () => _register(),
          ),
        );
      },
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

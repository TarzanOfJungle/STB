import 'package:flutter/material.dart';
import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/auth/models/post_login/post_login.dart';
import 'package:split_the_bill/ioc_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController(text: "");
  final _passwordController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final authController = get<AuthController>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
            ),
            TextField(
              controller: _passwordController,
            ),
            StreamBuilder<String?>(
              stream: authController.errorMessageStream,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  return Text(
                    snapshot.data!,
                    style: const TextStyle(color: Colors.red),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            ElevatedButton(
              onPressed: () {
                _login();
              },
              child: const Text("Log in"),
            ),
          ],
        ),
      ),
    );
  }

  void _login() {
    final authController = get<AuthController>();
    final loginData = PostLogin(
      email: _emailController.text,
      password: _passwordController.text,
    );
    authController.login(loginData);
  }
}

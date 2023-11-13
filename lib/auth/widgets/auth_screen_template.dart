import 'package:flutter/material.dart';

class AuthScreenTemplate extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Widget banner;
  final String title;
  final List<Widget> formFields;
  final Widget confirmButton;
  final Widget? appendix;

  const AuthScreenTemplate({
    super.key,
    required this.formKey,
    required this.banner,
    required this.title,
    required this.formFields,
    required this.confirmButton,
    this.appendix,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                banner,
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                ...formFields,
                const SizedBox(height: 20),
                confirmButton,
                const SizedBox(height: 35),
                if (appendix != null) appendix!
              ],
            ),
          ),
        ),
      ),
    );
  }
}

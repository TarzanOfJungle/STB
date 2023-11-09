import 'package:flutter/material.dart';
import 'package:split_the_bill/auth/screens/login_screen.dart';
import 'package:split_the_bill/common/widgets/snackbar_messanger_wrapper.dart';
import 'package:split_the_bill/ioc_container.dart';

void main() {
  IocContainer.setUpIoc();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Split the bill',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      builder: (context, child) {
        return SnackbarMessangerWrapper(
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}

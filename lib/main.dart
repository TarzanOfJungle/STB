import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/nav_routes.dart';
import 'package:split_the_bill/common/navigation/nav_router.dart';
import 'package:split_the_bill/common/theme/colors.dart';
import 'package:split_the_bill/common/theme/themes.dart';
import 'package:split_the_bill/common/widgets/wrappers/snackbar_messanger_wrapper.dart';
import 'package:split_the_bill/ioc_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  IocContainer.setUpIoc();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final _authController = get<AuthController>();
  // final _navRouter = get<NavRouter>();
  final _navigatorKey = get<GlobalKey<NavigatorState>>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Split the bill',
      debugShowCheckedModeBanner: false,
      theme: StbTheme.getTheme(StbColors.lightColors),
      darkTheme: StbTheme.getTheme(StbColors.darkColors),
      navigatorKey: _navigatorKey,
      routes: NavRouter.routes,
      initialRoute: NavRoutes.login,
      builder: (_, child) {
        // _authController.loggedInUserStream.listen((userState) {
        //   if (userState == null) {
        //     Future.delayed(Duration.zero, () => _navRouter.toLogin());
        //   }
        // });

        return SnackbarMessangerWrapper(
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}

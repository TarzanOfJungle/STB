import 'package:flutter/material.dart';
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
  final _navRouter = get<NavRouter>();
  
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _navRouter.router,
      title: 'Split the bill',
      debugShowCheckedModeBanner: false,
      theme: StbTheme.getTheme(StbColors.lightColors),
      darkTheme: StbTheme.getTheme(StbColors.darkColors),
      builder: (_, child) {
        return SnackbarMessangerWrapper(
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}

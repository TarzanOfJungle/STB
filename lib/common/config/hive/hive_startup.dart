import 'package:hive_flutter/hive_flutter.dart';
import 'package:split_the_bill/auth/models/authenticated_user/authenticated_user.dart';

abstract class HiveStartup {
  static Future<void> initHive() async {
    await Hive.initFlutter();
    await _initBoxes();
  }

  static Future<void> _initBoxes() async {
    Hive.registerAdapter(AuthenticatedUserAdapter());
  }
}

import 'package:flutter/material.dart';
import 'package:split_the_bill/common/config/firebase/firebase_startup.dart';
import 'package:split_the_bill/common/config/hive/hive_startup.dart';
import 'package:split_the_bill/ioc_container.dart';

abstract class Startup {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await FirebaseStartup.initFirebase();
    IocContainer.setUpIoc();
    await HiveStartup.initHive();
  }
}

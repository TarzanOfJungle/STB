import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:split_the_bill/firebase_options.dart';

abstract class FirebaseStartup {
  static Future<void> initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseMessaging.instance.setAutoInitEnabled(true);
    FirebaseMessaging.onBackgroundMessage(_fcmBackgroundMessageHandler);
  }

  static Future<void> _fcmBackgroundMessageHandler(
    RemoteMessage message,
  ) async {
    //await Firebase.initializeApp();
  }
}

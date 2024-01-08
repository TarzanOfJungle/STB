import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:split_the_bill/common/services/internet_connectivity_service.dart';
import 'package:split_the_bill/users/repositories/users_repository_base.dart';

class FcmController {
  final UsersRepositoryBase _usersRepository;
  final InternetConnectivityService _internetConnectivityService;
  // final _groupMessageNotifications =
  //     BehaviorSubject<ChatMessageNotification?>.seeded(null);

  FirebaseMessaging get _firebaseMessaging => FirebaseMessaging.instance;
  // Stream<ChatMessageNotification?> get groupMessageNotificationsStream =>
  //     _groupMessageNotifications.stream;

  FcmController(this._usersRepository, this._internetConnectivityService);

  // void _listenForRemoteMessages() {
  //   FirebaseMessaging.onMessage.listen((remoteMessage) {
  //     if (remoteMessage.notification == null) {
  //       return;
  //     }
  //     try {
  //       final groupMessageData =
  //           ChatMessageNotification.fromJson(remoteMessage.data);
  //       _groupMessageNotifications.add(groupMessageData);
  //     } catch (_) {}
  //   });
  // }

  Future<String?> _getNotificationToken() async {
    return await _firebaseMessaging.getToken();
  }

  Future updateNotificationToken() async {
    if (_internetConnectivityService.isConnectedToInternet) {
      try {
        await _requestNotificationPermissions();
        final token = await _getNotificationToken();
        if (token != null) {
          await _usersRepository.updateUserNotificationToken(
              notificationToken: token);
        }
      } catch (_) {}
    }
  }

  Future<void> _requestNotificationPermissions() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }
}

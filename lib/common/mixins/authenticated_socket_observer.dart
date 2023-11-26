import 'dart:async';

import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/auth/models/authenticated_user/authenticated_user.dart';
import 'package:split_the_bill/common/api/websocket_event.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:rxdart/rxdart.dart';

mixin AuthenticatedSocketObserver {
  final _authController = get<AuthController>();
  final Map<WebsocketEvent, StreamSubscription<AuthenticatedUser?>>
      _subscribtions = {};

  /// Method, that observes the given [eventStream] only when user is
  /// authenticated (if called before user is authenticated, it will 
  /// wait for user to login and then start listening). Also ensures 
  /// that [eventStream] subscribtion gets automatically cancelled when
  /// user logs out. Only one stream subscribtion for the given [event] can
  /// be active at a time. If another subscribtion for the same [event] is 
  /// attempted twice, the first subscribtion gets cancelled by the new one.
  void observeSocketEvents<T>({
    required WebsocketEvent event,
    required Stream<T> Function() eventStream,
    required void Function(T newValue) onValueChanged,
  }) {
    if (_subscribtions.containsKey(event)) {
      _subscribtions[event]?.cancel();
      _subscribtions.remove(event);
    }

    StreamSubscription<T>? eventSubscribtion;
    final subscribtion = _authController.loggedInUserStream.doOnCancel(() {
      eventSubscribtion?.cancel();
    }).listen(
      (user) {
        if (user != null && eventSubscribtion == null) {
          eventSubscribtion = eventStream().listen((value) {
            onValueChanged(value);
          });
        }
        if (user == null && eventSubscribtion != null) {
          eventSubscribtion!.cancel();
          eventSubscribtion = null;
        }
      },
    );

    _subscribtions[event] = subscribtion;
  }
}

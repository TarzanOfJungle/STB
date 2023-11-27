import 'dart:async';

import 'package:split_the_bill/auth/controllers/auth_controller.dart';
import 'package:split_the_bill/auth/models/authenticated_user/authenticated_user.dart';
import 'package:split_the_bill/ioc_container.dart';
import 'package:rxdart/rxdart.dart';

mixin AuthenticatedSocketObserver {
  final _authController = get<AuthController>();
  final Set<StreamSubscription<AuthenticatedUser?>> _subscribtions = {};

  /// Method, that observes the given [eventStream] only when user is
  /// authenticated (if called before user is authenticated, it will
  /// wait for user to login and then start listening). Also ensures
  /// that [eventStream] subscribtion gets automatically cancelled when
  /// user logs out.
  void observeSocketEvents<T>({
    required Stream<T> Function() eventStream,
    required void Function(T newValue) onValueChanged,
  }) {
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

    _subscribtions.add(subscribtion);
  }

  /// All running subscribtions (if any) are cancelled
  /// and the subscribtion set is cleared.
  void cancelAllSubscribtions() {
    for (var subscribtion in _subscribtions) {
      subscribtion.cancel();
    }
    _subscribtions.clear();
  }
}

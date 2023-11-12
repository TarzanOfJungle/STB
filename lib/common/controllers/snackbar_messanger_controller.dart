import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message.dart';

class SnackbarMessangerController {
  final BehaviorSubject<SnackbarMessage?> _snackbarMessage =
      BehaviorSubject.seeded(null);

  Stream<SnackbarMessage?> get snackbarMessageStream => _snackbarMessage.stream;

  void showSnackbarMessage(SnackbarMessage message) {
    _snackbarMessage.add(message);
  }

  /// Afer showing snackbar in UI, it's [wasShown] tag must be
  /// set to true, so that the snackbar doesn't get re-shown after
  /// StreamBuilder gets rebuilt
  void setMessageShown() {
    final shownMessage = _snackbarMessage.value?.copyWith(wasShown: true);
    _snackbarMessage.add(shownMessage);
  }
}

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
}

import 'dart:async';

import 'package:split_the_bill/common/models/snackbar_message/snackbar_message.dart';

class SnackbarMessangerController {
  final StreamController<SnackbarMessage> _snackbarMessageStreamController =
      StreamController.broadcast();

  Stream<SnackbarMessage> get snackbarMessageStream =>
      _snackbarMessageStreamController.stream;

  void showSnackbarMessage(SnackbarMessage message) {
    _snackbarMessageStreamController.add(message);
  }
}

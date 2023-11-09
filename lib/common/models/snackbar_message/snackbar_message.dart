import 'package:split_the_bill/common/models/snackbar_message/snackbar_message_category.dart';

class SnackbarMessage {
  final String message;
  final SnackbarMessageCategory category;

  SnackbarMessage({
    required this.message,
    required this.category,
  });
}

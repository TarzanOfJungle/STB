import 'package:split_the_bill/common/models/snackbar_message/snackbar_message_category.dart';

class SnackbarMessage {
  final String message;
  final SnackbarMessageCategory category;
  final bool wasShown;

  SnackbarMessage({
    required this.message,
    required this.category,
    this.wasShown = false,
  });

  SnackbarMessage copyWith({
    String? message,
    SnackbarMessageCategory? category,
    bool? wasShown,
  }) {
    return SnackbarMessage(
      message: message ?? this.message,
      category: category ?? this.category,
      wasShown: wasShown ?? this.wasShown,
    );
  }
}

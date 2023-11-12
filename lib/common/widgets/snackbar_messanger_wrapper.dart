import 'package:flutter/material.dart';
import 'package:split_the_bill/common/controllers/snackbar_messanger_controller.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message.dart';
import 'package:split_the_bill/ioc_container.dart';

const _SNACKBAR_FONT_SIZE = 16.0;
const _SNACKBAR_ICON_SIZE = 28.0;
const _SNACKBAR_CONTENT_COLOR = Colors.white;

class SnackbarMessangerWrapper extends StatelessWidget {
  final Widget child;

  SnackbarMessangerWrapper({
    super.key,
    required this.child,
  });

  final _snackbarMessageController = get<SnackbarMessangerController>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _snackbarMessageController.snackbarMessageStream,
      builder: (context, message) {
        final showMessage = !message.hasError &&
            message.hasData &&
            message.data != null &&
            !message.data!.wasShown;

        if (showMessage) {
          _showSnackbar(context: context, message: message.data!);
        }
        return child;
      },
    );
  }

  Future<void> _showSnackbar({
    required BuildContext context,
    required SnackbarMessage message,
  }) async {
    await Future.delayed(Duration.zero, () {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                message.category.icon,
                size: _SNACKBAR_ICON_SIZE,
                color: _SNACKBAR_CONTENT_COLOR,
              ),
              const SizedBox(width: 10),
              Text(
                message.message,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: _SNACKBAR_FONT_SIZE,
                  color: _SNACKBAR_CONTENT_COLOR,
                ),
              ),
            ],
          ),
          backgroundColor: message.category.color,
        ),
      );
    });
    _snackbarMessageController.setMessageShown();
  }
}

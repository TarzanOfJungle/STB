import 'dart:async';

import 'package:flutter/material.dart';
import 'package:split_the_bill/common/controllers/snackbar_messanger_controller.dart';
import 'package:split_the_bill/common/models/snackbar_message/snackbar_message.dart';
import 'package:split_the_bill/ioc_container.dart';

const _SNACKBAR_FONT_SIZE = 16.0;
const _SNACKBAR_ICON_SIZE = 28.0;
const _SNACKBAR_CONTENT_COLOR = Colors.white;

class SnackbarMessangerWrapper extends StatefulWidget {
  final Widget child;

  const SnackbarMessangerWrapper({
    super.key,
    required this.child,
  });

  @override
  State<SnackbarMessangerWrapper> createState() =>
      _SnackbarMessangerWrapperState();
}

class _SnackbarMessangerWrapperState extends State<SnackbarMessangerWrapper> {
  final _snackbarMessageController = get<SnackbarMessangerController>();
  late final StreamSubscription<SnackbarMessage?> _snackbarMessageSubscribtion;

  @override
  void initState() {
    _snackbarMessageSubscribtion = _snackbarMessageController
        .snackbarMessageStream
        .listen((snackbarMessage) {
      if (snackbarMessage != null) {
        _showSnackbar(
          context: context,
          message: snackbarMessage,
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _snackbarMessageSubscribtion.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showSnackbar({
    required BuildContext context,
    required SnackbarMessage message,
  }) {
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
  }
}

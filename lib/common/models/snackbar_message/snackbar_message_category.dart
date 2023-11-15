import 'package:flutter/material.dart';

enum SnackbarMessageCategory {
  SUCCESS(Colors.green, Icons.check_rounded),
  WARNING(Colors.amber, Icons.warning_rounded),
  INFO(Colors.blueGrey, Icons.info_rounded),
  ERROR(Colors.red, Icons.error_rounded);

  final Color color;
  final IconData icon;

  const SnackbarMessageCategory(this.color, this.icon);
}

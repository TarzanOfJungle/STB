import 'package:flutter/material.dart';
import 'package:split_the_bill/common/constants/ui_constants.dart';

enum SnackbarMessageCategory {
  SUCCESS(UiConstants.confirmColor, Icons.check_rounded),
  WARNING(UiConstants.warningColor, Icons.warning_rounded),
  INFO(UiConstants.infoColor, Icons.info_rounded),
  ERROR(Colors.red, Icons.error_rounded);

  final Color color;
  final IconData icon;

  const SnackbarMessageCategory(this.color, this.icon);
}

import 'package:flutter/material.dart';

const STANDARD_PADDING = 15.0;
const SMALL_PADDING = 8.0;
const STANDARD_BORDER_RADIUS = 10.0;

abstract class UiConstants {
  static const infoColor = Color.fromARGB(255, 105, 128, 139);
  static const deleteColor = Color.fromARGB(255, 210, 69, 58);
  static const confirmColor = Color.fromARGB(255, 69, 155, 76);
  static const warningColor = Color.fromARGB(255, 230, 174, 53);

  static const autoscrollDuration = Duration(milliseconds: 300);
  static const chatMessageVerticalMargin = 1.0;
  static const quantityIcon = Icons.functions_rounded;
  static const ammountIcon = Icons.paid_rounded;
}

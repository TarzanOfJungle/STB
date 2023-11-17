import 'package:flutter/material.dart';

class StbColors {
  final Brightness brightness;
  final Color primary;
  final Color onPrimary;
  final Color accent;
  final Color onAccent;
  final Color background;
  final Color backgroundVariant;
  final Color text;
  final Color shadow;
  final Color error;
  final Color onError;

  const StbColors({
    required this.brightness,
    required this.primary,
    required this.onPrimary,
    required this.accent,
    required this.onAccent,
    required this.background,
    required this.backgroundVariant,
    required this.text,
    required this.shadow,
    required this.error,
    required this.onError,
  });

  static const lightColors = StbColors(
    brightness: Brightness.light,
    primary: Color(0xFF47B891),
    onPrimary: Color(0xFFEDEDED),
    accent: Color(0xFFFF7A00),
    onAccent: Color(0xFFEDEDED),
    background: Color(0xFFEDEDED),
    backgroundVariant: Color(0xFFE4E4E4),
    text: Color(0xFF212121),
    shadow: Color(0xFF858585),
    error: Color(0xFFE30000),
    onError: Color(0xFFEDEDED),
  );

  static const darkColors = StbColors(
    brightness: Brightness.dark,
    primary: Color(0xFF28936E),
    onPrimary: Color(0xFFEDEDED),
    accent: Color(0xFFFF5722),
    onAccent: Color(0xFFEDEDED),
    background: Color(0xFF2B2B2B),
    backgroundVariant: Color(0xFF313131),
    text: Color(0xFFEDEDED),
    shadow: Color(0xFF444444),
    error: Color(0xFFE30000),
    onError: Color(0xFFEDEDED),
  );
}

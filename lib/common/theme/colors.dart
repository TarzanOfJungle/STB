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
  final Color bottomNavBar;

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
    required this.bottomNavBar,
  });

  static const lightColors = StbColors(
    brightness: Brightness.light,
    primary: Color(0xFFA78057),
    onPrimary: Color(0xFFEDEDED),
    accent: Color(0xFFA78057),
    onAccent: Color(0xFFEDEDED),
    background: Color(0xFFEDEDED),
    backgroundVariant: Color(0xFFE4E4E4),
    text: Color(0xFF212121),
    shadow: Color(0xFF858585),
    error: Color(0xFFD2453A),
    onError: Color(0xFFEDEDED),
    bottomNavBar: Color(0xFFFBFBFB),
  );

  static const darkColors = StbColors(
    brightness: Brightness.dark,
    primary: Color(0xFFEFC291),
    onPrimary: Color(0xFF2B2B2B),
    accent: Color(0xFFEFC291),
    onAccent: Color(0xFF2B2B2B),
    background: Color(0xFF2B2B2B),
    backgroundVariant: Color(0xFF262626),
    text: Color(0xFFEDEDED),
    shadow: Color(0xFF444444),
    error: Color(0xFFD2453A),
    onError: Color(0xFFEDEDED),
    bottomNavBar: Color(0xFF1F1F1F),
  );
}

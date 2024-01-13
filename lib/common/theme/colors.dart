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

  static const _creme = Color(0xFFEFC291);
  static const _onCreme = Color(0xFF2B2B2B);

  static const _cremeBrown = Color(0xFFA78057);
  static const _onCremeBrown = Color(0xFFEDEDED);

  static const lightColors = StbColors(
    brightness: Brightness.light,
    primary: _cremeBrown,
    onPrimary: _onCremeBrown,
    accent: _cremeBrown,
    onAccent: _onCremeBrown,
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
    primary: _creme,
    onPrimary: _onCreme,
    accent: _creme,
    onAccent: _onCreme,
    background: Color(0xFF2B2B2B),
    backgroundVariant: Color(0xFF262626),
    text: Color(0xFFEDEDED),
    shadow: Color(0xFF444444),
    error: Color(0xFFD2453A),
    onError: Color(0xFFEDEDED),
    bottomNavBar: Color(0xFF1F1F1F),
  );
}

import 'package:flutter/material.dart';
import 'package:split_the_bill/common/theme/colors.dart';

abstract class StbTheme {
  static ThemeData getTheme(StbColors colors) {
    return ThemeData(
        brightness: colors.brightness,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          brightness: colors.brightness,
          seedColor: colors.primary,
          primary: colors.primary,
          onPrimary: colors.onPrimary,
          background: colors.background,
          onBackground: colors.text,
          surface: colors.backgroundVariant,
          onSurface: colors.text,
          shadow: colors.shadow,
          secondary: colors.accent,
          onSecondary: colors.onAccent,
          error: colors.error,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: colors.background,
          foregroundColor: colors.text,
          elevation: 0,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: colors.accent,
          unselectedItemColor: colors.text,
          backgroundColor: colors.bottomNavBar,
          showUnselectedLabels: false,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colors.accent,
            foregroundColor: colors.onAccent,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            shadowColor: colors.shadow,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: colors.accent,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: Size.zero,
            padding: const EdgeInsets.all(0),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          filled: true,
          fillColor: colors.backgroundVariant,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: colors.accent,
          foregroundColor: colors.onAccent,
        ),
        dialogTheme: DialogTheme(
          backgroundColor: colors.backgroundVariant,
          surfaceTintColor: colors.backgroundVariant,
          shadowColor: colors.shadow,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            side: BorderSide.none,
          ),
        ),
        dividerTheme: DividerThemeData(
          color: colors.text.withOpacity(0.1),
          space: 0,
          thickness: 1.5,
        ));
  }
}

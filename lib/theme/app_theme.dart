import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/theme/colors.dart';

class AppTheme {
  const AppTheme();

  ThemeData get themeData {
    return ThemeData(
      fontFamily: 'Quicksand',
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: background,
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: veryDark,
        ),
        headlineSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: veryDark,
        ),
        labelSmall: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w800,
          color: pale,
        ),
        labelMedium: TextStyle(
          // fontSize: 12,
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: veryDark,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: veryDark,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: veryDark,
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
        surface: background,
        seedColor: veryDark,
        primary: veryDark,
        secondary: medium,
        tertiary: pale,
        onTertiary: extremelyPale,
      ),
    );
  }
}

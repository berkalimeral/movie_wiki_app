import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme get textTheme {
    return const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
      displayLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w800,
      ),
      displaySmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
      ),
      titleSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}

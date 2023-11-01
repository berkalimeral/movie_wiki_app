import 'package:flutter/material.dart';
import 'package:uni_society_app/core/theme/app_color_scheme.dart';
import 'package:uni_society_app/core/theme/app_text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get themeLight => ThemeData.light().copyWith(
        textTheme: AppTextTheme.textTheme,
        colorScheme: AppColorScheme.colorSchemeLight,
      );
  static ThemeData get themeDark => ThemeData.dark().copyWith(
        textTheme: AppTextTheme.textTheme,
        colorScheme: AppColorScheme.colorSchemeDark,
      );
}

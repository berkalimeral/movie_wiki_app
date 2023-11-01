import 'package:flutter/material.dart';
import 'package:uni_society_app/core/theme/app_color_scheme.dart';
import 'package:uni_society_app/core/theme/app_text_theme.dart';

import 'custom_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get themeLight => ThemeData.light().copyWith(
        textTheme: AppTextTheme.textTheme,
        colorScheme: AppColorScheme.colorSchemeLight,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(
            color: CustomColorsLight.onPrimary,
          ),
          unselectedIconTheme: IconThemeData(
            color: CustomColorsLight.surface,
          ),
        ),
      );
  static ThemeData get themeDark => ThemeData.dark().copyWith(
        textTheme: AppTextTheme.textTheme,
        colorScheme: AppColorScheme.colorSchemeDark,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(
            color: CustomColorsLight.primary,
          ),
          unselectedIconTheme: IconThemeData(
            color: CustomColorsLight.surface,
          ),
        ),
      );
}

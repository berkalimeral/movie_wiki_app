import 'package:flutter/material.dart';
import 'package:uni_society_app/core/theme/custom_colors.dart';

class AppColorScheme {
  AppColorScheme._();
  static ColorScheme get colorSchemeDark {
    return ColorScheme(
      brightness: Brightness.dark,
      primary: CustomColorsDark.primary,
      onPrimary: CustomColorsDark.onPrimary,
      secondary: CustomColorsDark.secondary,
      onSecondary: CustomColorsDark.onSecondary,
      error: CustomColorsDark.error,
      onError: CustomColorsDark.onError,
      background: CustomColorsDark.background,
      onBackground: CustomColorsDark.onBackground,
      surface: CustomColorsDark.surface,
      onSurface: CustomColorsDark.onSurface,
    );
  }

  static ColorScheme get colorSchemeLight {
    return ColorScheme(
      brightness: Brightness.dark,
      primary: CustomColorsLight.primary,
      onPrimary: CustomColorsLight.onPrimary,
      secondary: CustomColorsLight.secondary,
      onSecondary: CustomColorsLight.onSecondary,
      error: CustomColorsLight.error,
      onError: CustomColorsLight.onError,
      background: CustomColorsLight.background,
      onBackground: CustomColorsLight.onBackground,
      surface: CustomColorsLight.surface,
      onSurface: CustomColorsLight.onSurface,
    );
  }
}

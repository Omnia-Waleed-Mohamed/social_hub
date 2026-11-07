import 'package:flutter/material.dart';
import 'package:social_hub/core/constants/app_colors.dart';


abstract class LightColorScheme {
  LightColorScheme._();

  static const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.light,

    primary: AppColors.primary,
    onPrimary: AppColors.white,
    primaryContainer: Color(0xFFECE5FF),
    onPrimaryContainer: Color(0xFF32166F),

    secondary: AppColors.secondary,
    onSecondary: AppColors.white,
    secondaryContainer: Color(0xFFD7F7F2),
    onSecondaryContainer: Color(0xFF075E55),

    tertiary: Color(0xFFEF8D63),
    onTertiary: AppColors.white,
    tertiaryContainer: Color(0xFFFFE9DF),
    onTertiaryContainer: Color(0xFF783719),

    error: AppColors.error,
    onError: AppColors.white,
    errorContainer: Color(0xFFFFE4E1),
    onErrorContainer: Color(0xFF7A271A),

    surface: AppColors.lightSurface,
    onSurface: AppColors.lightTextPrimary,

    surfaceContainerLowest: AppColors.white,
    surfaceContainerLow: Color(0xFFFCFBFE),
    surfaceContainer: AppColors.lightBackground,
    surfaceContainerHigh: Color(0xFFF1EEFA),
    surfaceContainerHighest: Color(0xFFEAE7F2),

    onSurfaceVariant: AppColors.lightTextSecondary,
    outline: Color(0xFFD5D0E0),
    outlineVariant: AppColors.lightBorder,

    shadow: AppColors.black,
    scrim: AppColors.black,

    inverseSurface: Color(0xFF302D3A),
    onInverseSurface: AppColors.white,
    inversePrimary: AppColors.primaryLight,
  );
}
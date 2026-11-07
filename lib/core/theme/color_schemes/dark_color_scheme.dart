import 'package:flutter/material.dart';
import 'package:social_hub/core/constants/app_colors.dart';


abstract class DarkColorScheme {
  DarkColorScheme._();

  static const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.dark,

    primary: AppColors.primaryLight,
    onPrimary: AppColors.white,
    primaryContainer: Color(0xFF38266F),
    onPrimaryContainer: Color(0xFFECE5FF),

    secondary: Color(0xFF48D6C4),
    onSecondary: Color(0xFF003B35),
    secondaryContainer: Color(0xFF124D46),
    onSecondaryContainer: Color(0xFFD7F7F2),

    tertiary: Color(0xFFFFAD86),
    onTertiary: Color(0xFF51230E),
    tertiaryContainer: Color(0xFF713B24),
    onTertiaryContainer: Color(0xFFFFE9DF),

    error: Color(0xFFFF6B61),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF7A271A),
    onErrorContainer: Color(0xFFFFE4E1),

    surface: AppColors.darkSurface,
    onSurface: AppColors.darkTextPrimary,

    surfaceContainerLowest: Color(0xFF100F17),
    surfaceContainerLow: AppColors.darkBackground,
    surfaceContainer: AppColors.darkSurface,
    surfaceContainerHigh: AppColors.darkSurfaceVariant,
    surfaceContainerHighest: Color(0xFF343044),

    onSurfaceVariant: AppColors.darkTextSecondary,
    outline: Color(0xFF625C73),
    outlineVariant: AppColors.darkBorder,

    shadow: AppColors.black,
    scrim: AppColors.black,

    inverseSurface: Color(0xFFEAE7F2),
    onInverseSurface: Color(0xFF302D3A),
    inversePrimary: AppColors.primaryDark,
  );
}
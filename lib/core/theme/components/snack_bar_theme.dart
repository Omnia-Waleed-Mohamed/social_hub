import 'package:flutter/material.dart';
import 'package:social_hub/core/constants/app_radius.dart';
import 'package:social_hub/core/constants/app_spacing.dart';


abstract class AppSnackBarTheme {
  AppSnackBarTheme._();

  static SnackBarThemeData build(ColorScheme colors) {
    return SnackBarThemeData(
      backgroundColor: colors.inverseSurface,
      contentTextStyle: TextStyle(
        color: colors.onInverseSurface,
        fontSize: 14,
      ),
      actionTextColor: colors.primary,
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      insetPadding: const EdgeInsets.all(AppSpacing.lg),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:social_hub/core/constants/app_radius.dart';
import 'package:social_hub/core/constants/app_spacing.dart';


abstract class AppDialogTheme {
  AppDialogTheme._();

  static DialogThemeData build(ColorScheme colors) {
    return DialogThemeData(
      backgroundColor: colors.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.xl),
      ),
      titleTextStyle: TextStyle(
        color: colors.onSurface,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      contentTextStyle: TextStyle(
        color: colors.onSurfaceVariant,
        fontSize: 14,
      ),
      actionsPadding: const EdgeInsets.all(AppSpacing.lg),
    );
  }
}
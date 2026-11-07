import 'package:flutter/material.dart';
import 'package:social_hub/core/constants/app_dimensions.dart';
import 'package:social_hub/core/constants/app_radius.dart';
import 'package:social_hub/core/constants/app_spacing.dart';


abstract class AppInputTheme {
  AppInputTheme._();

  static InputDecorationTheme build(ColorScheme colors) {
    return InputDecorationTheme(
      filled: true,
      fillColor: colors.surfaceContainerLow,

      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.lg,
      ),

      hintStyle: TextStyle(
        color: colors.onSurfaceVariant,
        fontSize: 14,
      ),

      labelStyle: TextStyle(
        color: colors.onSurfaceVariant,
        fontSize: 14,
      ),

      errorStyle: TextStyle(
        color: colors.error,
        fontSize: 12,
      ),

      prefixIconColor: colors.onSurfaceVariant,
      suffixIconColor: colors.onSurfaceVariant,

      constraints: const BoxConstraints(
        minHeight: AppDimensions.inputHeight,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: BorderSide(color: colors.outlineVariant),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: BorderSide(color: colors.outlineVariant),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: BorderSide(
          color: colors.primary,
          width: AppDimensions.focusedBorderWidth,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: BorderSide(color: colors.error),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: BorderSide(
          color: colors.error,
          width: AppDimensions.focusedBorderWidth,
        ),
      ),
    );
  }
}
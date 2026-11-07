import 'package:flutter/material.dart';
import 'package:social_hub/core/constants/app_radius.dart';
import 'package:social_hub/core/constants/app_spacing.dart';


abstract class AppChipTheme {
  AppChipTheme._();

  static ChipThemeData build(ColorScheme colors) {
    return ChipThemeData(
      backgroundColor: colors.surfaceContainer,
      selectedColor: colors.primaryContainer,
      disabledColor: colors.surfaceContainerHighest,

      labelStyle: TextStyle(
        color: colors.onSurface,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),

      secondaryLabelStyle: TextStyle(
        color: colors.onPrimaryContainer,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),

      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),

      side: BorderSide(
        color: colors.outlineVariant,
      ),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.circular),
      ),

      showCheckmark: false,
    );
  }
}
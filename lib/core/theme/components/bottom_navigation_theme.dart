import 'package:flutter/material.dart';
import 'package:social_hub/core/constants/app_dimensions.dart';
import 'package:social_hub/core/constants/app_radius.dart';
import 'package:social_hub/core/constants/app_spacing.dart';


abstract class AppBottomNavigationTheme {
  AppBottomNavigationTheme._();

  static NavigationBarThemeData build(ColorScheme colors) {
    return NavigationBarThemeData(
      height: AppDimensions.bottomNavigationHeight,
      backgroundColor: colors.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,

      indicatorColor: colors.primaryContainer,

      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,

      iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(
              color: colors.primary,
              size: AppDimensions.iconLarge,
            );
          }

          return IconThemeData(
            color: colors.onSurfaceVariant,
            size: AppDimensions.iconLarge,
          );
        },
      ),

      labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
        (states) {
          final isSelected = states.contains(WidgetState.selected);

          return TextStyle(
            color: isSelected ? colors.primary : colors.onSurfaceVariant,
            fontSize: 11,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          );
        },
      ),

      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.circular),
      ),

      labelPadding: const EdgeInsets.only(top: AppSpacing.xs),
    );
  }
}
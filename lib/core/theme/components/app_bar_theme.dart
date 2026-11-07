import 'package:flutter/material.dart';
import 'package:social_hub/core/constants/app_dimensions.dart';
import 'package:social_hub/core/constants/app_spacing.dart';


abstract class AppBarThemeConfig {
  AppBarThemeConfig._();

  static AppBarTheme build(ColorScheme colors) {
    return AppBarTheme(
      backgroundColor: colors.surface,
      foregroundColor: colors.onSurface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      toolbarHeight: AppDimensions.appBarHeight,
      titleSpacing: AppSpacing.screenPadding,
      titleTextStyle: TextStyle(
        color: colors.onSurface,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      iconTheme: IconThemeData(
        color: colors.onSurface,
        size: 24,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:social_hub/core/constants/app_radius.dart';


abstract class AppCardTheme {
  AppCardTheme._();

  static CardThemeData build(ColorScheme colors) {
    return CardThemeData(
      color: colors.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        side: BorderSide(color: colors.outlineVariant),
      ),
    );
  }
}
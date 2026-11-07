import 'package:flutter/material.dart';
import 'color_schemes/dark_color_scheme.dart';
import 'components/app_bar_theme.dart';
import 'components/bottom_navigation_theme.dart';
import 'components/button_theme.dart';
import 'components/card_theme.dart';
import 'components/chip_theme.dart';
import 'components/dialog_theme.dart';
import 'components/input_theme.dart';
import 'components/snack_bar_theme.dart';
import 'typography.dart';

abstract class DarkTheme {
  DarkTheme._();

  static ThemeData build() {
    final colors = DarkColorScheme.colorScheme;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colors,

      scaffoldBackgroundColor: colors.surfaceContainerLow,

      fontFamily: AppTypography.fontFamily,
      textTheme: AppTypography.textTheme.apply(
        bodyColor: colors.onSurface,
        displayColor: colors.onSurface,
      ),

      appBarTheme: AppBarThemeConfig.build(colors),

      elevatedButtonTheme: AppButtonTheme.elevated(colors),
      outlinedButtonTheme: AppButtonTheme.outlined(colors),
      textButtonTheme: AppButtonTheme.text(colors),

      inputDecorationTheme: AppInputTheme.build(colors),

      cardTheme: AppCardTheme.build(colors),

      navigationBarTheme: AppBottomNavigationTheme.build(colors),

      chipTheme: AppChipTheme.build(colors),

      dialogTheme: AppDialogTheme.build(colors),

      snackBarTheme: AppSnackBarTheme.build(colors),

      dividerTheme: DividerThemeData(
        color: colors.outlineVariant,
        thickness: 1,
        space: 1,
      ),

      iconTheme: IconThemeData(
        color: colors.onSurfaceVariant,
        size: 24,
      ),

      listTileTheme: ListTileThemeData(
        iconColor: colors.onSurfaceVariant,
        textColor: colors.onSurface,
        tileColor: colors.surface,
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
        elevation: 2,
      ),

      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colors.primary,
        linearTrackColor: colors.primaryContainer,
      ),

      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.primary;
          }
          return colors.surface;
        }),
        checkColor: WidgetStateProperty.all(colors.onPrimary),
        side: BorderSide(color: colors.outline),
      ),

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? colors.onPrimary
              : colors.onSurfaceVariant;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? colors.primary
              : colors.surfaceContainerHighest;
        }),
      ),
    );
  }
}
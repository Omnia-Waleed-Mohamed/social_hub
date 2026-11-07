import 'package:flutter/material.dart';

abstract class AppColors {
  AppColors._();

  // Brand
  static const Color primary = Color(0xFF7047EB);
  static const Color primaryLight = Color(0xFF8B6CF2);
  static const Color primaryDark = Color(0xFF5933CC);

  // Accent
  static const Color secondary = Color(0xFF16B8A6);

  // Semantic
  static const Color success = Color(0xFF12B76A);
  static const Color warning = Color(0xFFF79009);
  static const Color error = Color(0xFFF04438);
  static const Color info = Color(0xFF2E90FA);

  // Light Mode
  static const Color lightBackground = Color(0xFFF8F7FC);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceVariant = Color(0xFFF1EEFA);
  static const Color lightBorder = Color(0xFFEAE7F2);

  static const Color lightTextPrimary = Color(0xFF19152B);
  static const Color lightTextSecondary = Color(0xFF777386);
  static const Color lightTextDisabled = Color(0xFFB7B3C2);

  // Dark Mode
  static const Color darkBackground = Color(0xFF12111A);
  static const Color darkSurface = Color(0xFF1D1B29);
  static const Color darkSurfaceVariant = Color(0xFF292638);
  static const Color darkBorder = Color(0xFF373347);

  static const Color darkTextPrimary = Color(0xFFF5F3FA);
  static const Color darkTextSecondary = Color(0xFFAAA5BB);
  static const Color darkTextDisabled = Color(0xFF706B7D);

  // Common
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;
}
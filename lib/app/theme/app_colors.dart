import 'package:flutter/material.dart';

class AppColors {
  // Primary Palette
  static const Color primary = Color(0xFFF08EA2);
  static const Color primaryContainer = Color(0xFFFAD6E1); // Soft Pink

  // Secondary / Accents
  static const Color secondary = Color(0xFF8B5D7A); // Deep Plum
  static const Color secondaryContainer = Color(
    0xFFE5CFDC,
  ); // Lighter Plum (derived)
  static const Color accent = Color(0xFFF6C96B); // Warm Accent
  static const Color tertiary = Color(0xFFA9C6B0); // Sage Green

  // Background & Surface
  static const Color background = Color(0xFFFFF6F8);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceSoft = Color(
    0xFFFDF0F3,
  ); // Very light pinkish surface

  // Text
  static const Color textPrimary = Color(0xFF4A3043);
  static const Color textSecondary = Color(0xFF806A78);
  static const Color textInverse = Color(0xFFFFFFFF);

  // States
  static const Color success = Color(0xFF63906D);
  static const Color error = Color(0xFFC94F64);

  // Utilities
  static const Color borderSoft = Color(0xFFEADAE0);
  static const Color disabled = Color(0xFFD4C7CE);
  static const Color overlay = Color(0x334A3043); // textPrimary at 20% opacity
}

import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppGradients {
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFFF08EA2), Color(0xFFD96D91)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient softPinkGradient = LinearGradient(
    colors: [AppColors.primaryContainer, Color(0xFFFDE8EF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient pregnancyGradient = LinearGradient(
    colors: [Color(0xFF8B5D7A), Color(0xFF704561)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient warmGradient = LinearGradient(
    colors: [Color(0xFFF6C96B), Color(0xFFF0B345)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

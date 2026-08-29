import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppShadows {
  static final List<BoxShadow> soft = [
    BoxShadow(
      color: AppColors.secondary.withValues(alpha: 0.05),
      blurRadius: 10,
      offset: const Offset(0, 4),
    ),
  ];

  static final List<BoxShadow> card = [
    BoxShadow(
      color: AppColors.secondary.withValues(alpha: 0.08),
      blurRadius: 16,
      offset: const Offset(0, 8),
      spreadRadius: 0,
    ),
  ];

  static final List<BoxShadow> floating = [
    BoxShadow(
      color: AppColors.primary.withValues(alpha: 0.15),
      blurRadius: 24,
      offset: const Offset(0, 12),
      spreadRadius: -4,
    ),
  ];

  static final List<BoxShadow> navigation = [
    BoxShadow(
      color: AppColors.textPrimary.withValues(alpha: 0.04),
      blurRadius: 20,
      offset: const Offset(0, -4),
    ),
  ];
}

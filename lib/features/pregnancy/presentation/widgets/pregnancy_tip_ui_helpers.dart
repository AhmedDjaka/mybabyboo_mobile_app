import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../domain/entities/pregnancy_tip.dart';

class PregnancyTipUiHelpers {
  static Color getColorForCategory(PregnancyTipCategory category) {
    switch (category) {
      case PregnancyTipCategory.wellbeing:
        return AppColors.primary;
      case PregnancyTipCategory.nutrition:
        return const Color(0xFFF29C38);
      case PregnancyTipCategory.sleep:
        return const Color(0xFF5B699C);
      case PregnancyTipCategory.activity:
        return const Color(0xFF4CAE4F);
      case PregnancyTipCategory.organization:
        return const Color(0xFF9C27B0);
      case PregnancyTipCategory.unknown:
        return AppColors.textSecondary;
    }
  }

  static String getLabelForCategory(PregnancyTipCategory category) {
    switch (category) {
      case PregnancyTipCategory.wellbeing:
        return 'BIEN-ÊTRE';
      case PregnancyTipCategory.nutrition:
        return 'ALIMENTATION';
      case PregnancyTipCategory.sleep:
        return 'SOMMEIL';
      case PregnancyTipCategory.activity:
        return 'ACTIVITÉ';
      case PregnancyTipCategory.organization:
        return 'ORGANISATION';
      case PregnancyTipCategory.unknown:
        return 'CONSEIL';
    }
  }

  static IconData getIconForCategory(PregnancyTipCategory category) {
    switch (category) {
      case PregnancyTipCategory.wellbeing:
        return Icons.spa_rounded;
      case PregnancyTipCategory.nutrition:
        return Icons.restaurant_rounded;
      case PregnancyTipCategory.sleep:
        return Icons.bedtime_rounded;
      case PregnancyTipCategory.activity:
        return Icons.directions_run_rounded;
      case PregnancyTipCategory.organization:
        return Icons.checklist_rtl_rounded;
      case PregnancyTipCategory.unknown:
        return Icons.lightbulb_outline_rounded;
    }
  }
}

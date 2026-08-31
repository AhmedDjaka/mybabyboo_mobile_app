import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../domain/entities/pregnancy_tip.dart';
import 'pregnancy_tip_bottom_sheet.dart';
import 'pregnancy_tip_illustration_view.dart';
import 'pregnancy_tip_ui_helpers.dart';

class PregnancyTipCard extends StatelessWidget {
  final PregnancyTip tip;
  final int? currentWeek;
  final bool isDailyTip;

  const PregnancyTipCard({
    super.key,
    required this.tip,
    this.currentWeek,
    this.isDailyTip = false,
  });

  @override
  Widget build(BuildContext context) {
    final categoryColor = PregnancyTipUiHelpers.getColorForCategory(
      tip.category,
    );
    final categoryLabel = PregnancyTipUiHelpers.getLabelForCategory(
      tip.category,
    );

    String? badgeLabel;
    Color? badgeColor;
    if (!isDailyTip) {
      if (currentWeek != null && tip.week == currentWeek) {
        badgeLabel = 'NOUVEAU';
        badgeColor = AppColors.primary;
      } else if (tip.isFeatured) {
        badgeLabel = 'À LA UNE';
        badgeColor = const Color(0xFFE5B05C);
      } else if (tip.week != null) {
        badgeLabel = 'SEMAINE ${tip.week}';
        badgeColor = AppColors.textSecondary;
      }
    }

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          useRootNavigator: true,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => PregnancyTipBottomSheet(tip: tip),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.textPrimary.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PregnancyTipIllustrationView(
              imageUrl: tip.illustration?.thumbnailUrl,
              category: tip.category.name,
              width: 100,
              height: 100,
              borderRadius: BorderRadius.circular(16),
              altText: tip.illustration?.altText,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        categoryLabel,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: categoryColor,
                          letterSpacing: 0.5,
                        ),
                      ),
                      if (badgeLabel != null) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color:
                                badgeColor?.withValues(alpha: 0.1) ??
                                AppColors.background,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            badgeLabel,
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: badgeColor,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    tip.title,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    tip.summary,
                    style: const TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 14,
                      color: AppColors.textSecondary,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

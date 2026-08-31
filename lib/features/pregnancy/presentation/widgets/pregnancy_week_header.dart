import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../app/theme/app_colors.dart';
import '../../domain/entities/pregnancy.dart';

class PregnancyWeekHeader extends StatelessWidget {
  final Pregnancy currentPregnancy;
  final int selectedWeek;
  final int currentWeek;

  const PregnancyWeekHeader({
    super.key,
    required this.currentPregnancy,
    required this.selectedWeek,
    required this.currentWeek,
  });

  @override
  Widget build(BuildContext context) {
    final gestationalAge = currentPregnancy.gestationalAge;
    final isCurrentWeekSelected = selectedWeek == currentWeek;

    final formattedDueDate = currentPregnancy.dueDate != null
        ? DateFormat('d MMMM yyyy', 'fr_FR').format(currentPregnancy.dueDate!)
        : null;

    final progressPercent = (gestationalAge?.totalDays ?? 0) / 280.0;
    // Cap progress between 0 and 1
    final progressBounded = progressPercent.clamp(0.0, 1.0);

    // Remaining weeks calculation
    final remainingWeeks = 40 - currentWeek;

    // Trimester pill text
    String trimesterText = '';
    if (selectedWeek < 14) {
      trimesterText = '1er trimestre';
    } else if (selectedWeek < 28) {
      trimesterText = '2e trimestre';
    } else {
      trimesterText = '3e trimestre';
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate max width for the illustration to not overlap text awkwardly on small phones
        // The master branding shows Boo overlapping slightly on the right side.
        // We'll give it roughly 40-45% of the card width.
        final illustrationWidth = constraints.maxWidth * 0.45;

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.surface, // Pure white for cards in new branding
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(
                  alpha: 0.05,
                ), // Very soft shadow
                blurRadius: 15,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TOP ZONE
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // LEFT CONTENT
                    Padding(
                      padding: EdgeInsets.only(
                        right: illustrationWidth - 20,
                      ), // Reserve space for image
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Semaine',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '$selectedWeek',
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 42,
                                  height: 1.1,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              const SizedBox(width: 8),
                              if (isCurrentWeekSelected &&
                                  gestationalAge != null)
                                Expanded(
                                  child: Text(
                                    '${gestationalAge.weeks} SA + ${gestationalAge.days} jours',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 8),

                          // Trimester pill
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primaryContainer,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              trimesterText,
                              style: const TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),

                          if (remainingWeeks > 0)
                            Text(
                              'Encore environ $remainingWeeks semaines',
                              style: const TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textPrimary,
                              ),
                            ),
                        ],
                      ),
                    ),

                    // RIGHT CONTENT (Baby Illustration)
                    Positioned(
                      right:
                          -10, // Small deliberate overflow according to Master Branding
                      top: 0,
                      bottom: 0,
                      child: IgnorePointer(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: illustrationWidth,
                            child: Image.asset(
                              'assets/illustrations/home/home_baby_boo.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // BOTTOM ZONE
                const Text(
                  'Progression de ma grossesse',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: progressBounded,
                          minHeight: 10,
                          backgroundColor: AppColors.primaryContainer,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      width: 40,
                      child: Text(
                        '${(progressBounded * 100).toInt()} %',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                ),

                if (formattedDueDate != null) ...[
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColors.primaryContainer,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Icon(
                          Icons.calendar_month_rounded,
                          size: 14,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'DPA : $formattedDueDate',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Quicksand',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

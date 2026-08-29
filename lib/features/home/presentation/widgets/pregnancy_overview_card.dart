import 'package:flutter/material.dart';
import '../../domain/entities/home_summary.dart';
import 'pregnancy_progress_bar.dart';

class PregnancyOverviewCard extends StatelessWidget {
  final HomePregnancy pregnancy;

  const PregnancyOverviewCard({super.key, required this.pregnancy});

  @override
  Widget build(BuildContext context) {
    final weeks = pregnancy.gestationalAge?.weeks ?? 0;
    final days = pregnancy.gestationalAge?.days ?? 0;
    final trimester = pregnancy.trimester ?? 1;

    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: const Color(0xFFFFF6F8),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF8B5D7A).withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isVerySmall = constraints.maxWidth < 320;

          return Stack(
            children: [
              // Subtle background decoration (stars/hearts)
              Positioned(
                top: 24,
                right: constraints.maxWidth * 0.35,
                child: const Icon(
                  Icons.star_rounded,
                  color: Color(0xFFFAD6E1),
                  size: 16,
                ),
              ),
              Positioned(
                bottom: 40,
                left: constraints.maxWidth * 0.45,
                child: const Icon(
                  Icons.favorite_rounded,
                  color: Color(0xFFFAD6E1),
                  size: 12,
                ),
              ),

              // Woman illustration on the right
              Positioned(
                right: isVerySmall ? -40 : -20,
                bottom: 0,
                top: 0,
                child: Image.asset(
                  'assets/illustrations/home/home_pregnant_woman.png',
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomRight,
                  // Scale width dynamically based on constraints (40-45% width)
                  width: constraints.maxWidth * (isVerySmall ? 0.55 : 0.45),
                ),
              ),

              // Left Content
              Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Ma grossesse',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                              color: Color(0xFF8B5D7A),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '$weeks',
                                style: TextStyle(
                                  fontSize: isVerySmall ? 40 : 48,
                                  height: 1.0,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Poppins',
                                  color: const Color(0xFF4A3043),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'semaines\n+ $days jours',
                                  style: TextStyle(
                                    fontSize: isVerySmall ? 13 : 15,
                                    height: 1.2,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                    color: const Color(0xFF4A3043),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFAD6E1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              trimester == 1
                                  ? '1er trimestre'
                                  : '${trimester}e trimestre',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                                color: Color(0xFF8B5D7A),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          if (pregnancy.progressPercentage != null)
                            PregnancyProgressBar(
                              progressPercentage: pregnancy.progressPercentage!,
                            ),
                          const SizedBox(height: 24),
                          if (pregnancy.dueDate != null)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.calendar_month_rounded,
                                  color: Color(0xFFF08EA2),
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Date prévue d\'accouchement',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: 'Quicksand',
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF806A78),
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        _formatDate(pregnancy.dueDate!),
                                        style: TextStyle(
                                          fontSize: isVerySmall ? 12 : 14,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Poppins',
                                          color: const Color(0xFF4A3043),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: const SizedBox(), // Spacer for the image
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  String _formatDate(String isoDate) {
    try {
      final date = DateTime.parse(isoDate);
      final months = [
        '',
        'janvier',
        'février',
        'mars',
        'avril',
        'mai',
        'juin',
        'juillet',
        'août',
        'septembre',
        'octobre',
        'novembre',
        'décembre',
      ];
      return '${date.day} ${months[date.month]} ${date.year}';
    } catch (e) {
      return isoDate;
    }
  }
}

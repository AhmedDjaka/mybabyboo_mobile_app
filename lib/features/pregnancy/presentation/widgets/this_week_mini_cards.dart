import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_colors.dart';
import 'boo_bottom_sheet.dart';
import 'mom_bottom_sheet.dart';

class ThisWeekMiniCards extends StatelessWidget {
  final double? sizeCm;
  final int? weightG;
  final String? fruitComparison;
  final String? booDescription;
  final String? momChanges;

  const ThisWeekMiniCards({
    super.key,
    this.sizeCm,
    this.weightG,
    this.fruitComparison,
    this.booDescription,
    this.momChanges,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // We have 3 cards. Let's calculate the width to fit all 3 with small gaps.
        const double totalGap = 16.0; // 8px gap between cards (2 gaps)
        final double cardWidth = (constraints.maxWidth - totalGap) / 3;

        return IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: cardWidth,
                child: _MiniCard(
                  title: 'Boo grandit',
                  subtitle: 'Développement',
                  imagePath: 'assets/illustrations/home/home_baby_boo.png',
                  onTap: () => BooBottomSheet.show(
                    context,
                    sizeCm: sizeCm,
                    weightG: weightG,
                    fruitComparison: fruitComparison,
                    description: booDescription,
                  ),
                ),
              ),
              SizedBox(
                width: cardWidth,
                child: _MiniCard(
                  title: 'Maman',
                  subtitle: 'Ce qui change',
                  imagePath:
                      'assets/illustrations/home/home_pregnant_woman.png',
                  onTap: () {
                    if (momChanges != null && momChanges!.isNotEmpty) {
                      MomBottomSheet.show(context, momChanges: momChanges!);
                    }
                  },
                ),
              ),
              SizedBox(
                width: cardWidth,
                child: _MiniCard(
                  title: 'Conseils',
                  subtitle: 'pour vous',
                  icon: Icons.spa_rounded,
                  onTap: () => context.push('/pregnancy/tips'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _MiniCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? imagePath;
  final IconData? icon;
  final VoidCallback onTap;

  const _MiniCard({
    required this.title,
    required this.subtitle,
    this.imagePath,
    this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16),

              const SizedBox(height: 8),
              SizedBox(
                height: 56,
                child: imagePath != null
                    ? Image.asset(imagePath!, fit: BoxFit.contain)
                    : Icon(icon, size: 40, color: AppColors.primary),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                  fontFamily: 'Poppins',
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                  fontFamily: 'Quicksand',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

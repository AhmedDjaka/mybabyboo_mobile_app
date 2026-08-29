import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_colors.dart';
import 'boo_bottom_sheet.dart';
import 'mom_bottom_sheet.dart';
import 'symptoms_bottom_sheet.dart';

class PregnancyBookmarksSection extends StatelessWidget {
  final double? sizeCm;
  final int? weightG;
  final String? fruitComparison;
  final String? booDescription;
  final String? momChanges;

  const PregnancyBookmarksSection({
    super.key,
    this.sizeCm,
    this.weightG,
    this.fruitComparison,
    this.booDescription,
    this.momChanges,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Mes repères',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            final double maxWidth = constraints.maxWidth;
            final bool isSmallPhone = maxWidth < 380;
            
            final double horizontalGap = 12.0;
            final double verticalGap = 12.0;
            
            // Si small phone : 2 colonnes, sinon 4 colonnes
            final int crossAxisCount = isSmallPhone ? 2 : 4;
            
            final double cardWidth = (maxWidth - (horizontalGap * (crossAxisCount - 1))) / crossAxisCount;

            final cards = [
              _BookmarkCard(
                width: cardWidth,
                title: 'Bébé',
                svgPath: 'assets/icons/pregnancy/baby.svg',
                onTap: () => BooBottomSheet.show(
                  context,
                  sizeCm: sizeCm,
                  weightG: weightG,
                  fruitComparison: fruitComparison,
                  description: booDescription,
                ),
              ),
              _BookmarkCard(
                width: cardWidth,
                title: 'Maman',
                svgPath: 'assets/icons/pregnancy/mother.svg',
                onTap: () {
                  if (momChanges != null && momChanges!.isNotEmpty) {
                    MomBottomSheet.show(context, momChanges: momChanges!);
                  }
                },
              ),
              _BookmarkCard(
                width: cardWidth,
                title: 'Conseils',
                svgPath: 'assets/icons/pregnancy/tips.svg',
                onTap: () => context.push('/pregnancy/tips'),
              ),
              _BookmarkCard(
                width: cardWidth,
                title: 'Symptômes',
                svgPath: 'assets/icons/pregnancy/symptoms.svg',
                onTap: () => SymptomsBottomSheet.show(context),
              ),
            ];

            if (isSmallPhone) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [cards[0], cards[1]],
                  ),
                  SizedBox(height: verticalGap),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [cards[2], cards[3]],
                  ),
                ],
              );
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: cards,
              );
            }
          },
        ),
      ],
    );
  }
}

class _BookmarkCard extends StatelessWidget {
  final double width;
  final String title;
  final String svgPath;
  final VoidCallback onTap;

  const _BookmarkCard({
    required this.width,
    required this.title,
    required this.svgPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 8.0),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 42,
              child: _buildIcon(),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return SvgPicture.asset(
      svgPath,
      fit: BoxFit.contain,
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';

class OnboardingFeatureItem extends StatelessWidget {
  const OnboardingFeatureItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.primaryContainer, // Cercle pastel
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.favorite, // Petite icône
              size: 14,
              color: AppColors.primary, // Soft Pink ou Primary Pink
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
              fontFamily: 'Quicksand',
            ),
          ),
        ],
      ),
    );
  }
}

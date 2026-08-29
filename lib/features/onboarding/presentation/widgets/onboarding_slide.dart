import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../viewmodels/onboarding_slide_data.dart';
import 'onboarding_feature_item.dart';

class OnboardingSlide extends StatelessWidget {
  const OnboardingSlide({super.key, required this.data});

  final OnboardingSlideData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
      child: Column(
        children: [
          const SizedBox(height: AppSpacing.xxl),

          // Titre
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins',
              height: 1.3,
            ),
          ),

          const SizedBox(height: AppSpacing.lg),

          // Description (si présente)
          if (data.description != null)
            Text(
              data.description!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
                fontFamily: 'Quicksand',
              ),
            ),

          // Liste d'items (si présente)
          if (data.items != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: data.items!.map((item) {
                    return OnboardingFeatureItem(text: item);
                  }).toList(),
                ),
              ],
            ),

          // Illustration (prend le reste de l'espace en bas)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: AppSpacing.xl,
                bottom: AppSpacing.md,
              ),
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  data.illustrationAsset,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    // Placeholder propre si l'asset manque
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.primaryContainer,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.image_outlined,
                          size: 64,
                          color: AppColors.primary.withValues(alpha: 0.5),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

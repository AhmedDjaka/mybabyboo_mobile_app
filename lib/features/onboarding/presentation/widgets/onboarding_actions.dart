import 'package:flutter/material.dart';

import '../../../../app/theme/app_spacing.dart';
import '../../../../shared/widgets/app_button.dart';

class OnboardingActions extends StatelessWidget {
  const OnboardingActions({
    super.key,
    required this.isLastPage,
    required this.onNextPressed,
  });

  final bool isLastPage;
  final VoidCallback onNextPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: isLastPage
            ? AppButton(
                key: const ValueKey('finish'),
                text: 'Commencer',
                onPressed: onNextPressed,
                type: AppButtonType.primary,
              )
            : AppButton(
                key: const ValueKey('next'),
                text: 'Suivant',
                onPressed: onNextPressed,
                type: AppButtonType.primary,
              ),
      ),
    );
  }
}

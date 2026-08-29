import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_spacing.dart';
import '../viewmodels/onboarding_slide_data.dart';
import '../viewmodels/onboarding_viewmodel.dart';
import '../widgets/onboarding_slide.dart';
import '../widgets/onboarding_indicator.dart';
import '../widgets/onboarding_actions.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextPressed(bool isLastPage) {
    if (isLastPage) {
      ref.read(onboardingViewModelProvider.notifier).completeOnboarding().then((
        _,
      ) {
        if (mounted) context.go('/auth');
      });
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _onSkipPressed() {
    ref.read(onboardingViewModelProvider.notifier).completeOnboarding().then((
      _,
    ) {
      if (mounted) context.go('/auth');
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingViewModelProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Bouton "Passer" en haut (20-25% header)
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: AppSpacing.md,
                  right: AppSpacing.md,
                ),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: state.isLastPage ? 0.0 : 1.0,
                  child: TextButton(
                    onPressed: state.isLastPage ? null : _onSkipPressed,
                    child: Text(
                      'Passer',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // PageView pour les Slides
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingSlides.length,
                onPageChanged: (index) {
                  ref
                      .read(onboardingViewModelProvider.notifier)
                      .onPageChanged(index);
                },
                itemBuilder: (context, index) {
                  return OnboardingSlide(data: onboardingSlides[index]);
                },
              ),
            ),

            // Indicateurs et Actions (10% footer)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxl),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OnboardingIndicator(
                    count: onboardingSlides.length,
                    currentIndex: state.currentPage,
                  ),
                  const SizedBox(height: AppSpacing.xxxl),
                  OnboardingActions(
                    isLastPage: state.isLastPage,
                    onNextPressed: () => _onNextPressed(state.isLastPage),
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../features/auth/presentation/viewmodels/auth_viewmodel.dart';
import '../setup/profile_identity_step.dart';
import '../setup/profile_preferences_step.dart';
import '../viewmodels/profile_setup_viewmodel.dart';
import '../../../../shared/widgets/accessibility/voice_assistance_banner.dart';

class ProfileSetupPage extends ConsumerStatefulWidget {
  const ProfileSetupPage({super.key});

  @override
  ConsumerState<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends ConsumerState<ProfileSetupPage> {
  final PageController _pageController = PageController();
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final authSession = ref.read(authViewModelProvider).valueOrNull;
      if (authSession != null) {
        ref
            .read(profileSetupViewModelProvider.notifier)
            .prefillFromAuthUser(authSession.user);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToStep(int step) {
    setState(() => _currentStep = step);
    _pageController.animateToPage(
      step,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _handleSubmit() async {
    final success = await ref
        .read(profileSetupViewModelProvider.notifier)
        .submit();
    if (success && mounted) {
      // Le routeur s'occupera de la navigation vers la prochaine étape
      // grâce à l'update de state dans profile_setup_viewmodel
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // ─── Top bar ─────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 12, 16, 0),
              child: Row(
                children: [
                  if (_currentStep > 0)
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 20,
                        color: AppColors.textPrimary,
                      ),
                      onPressed: () => _goToStep(_currentStep - 1),
                      tooltip: 'Étape précédente',
                    )
                  else
                    const SizedBox(width: 48),
                  const Spacer(),
                  _StepIndicator(currentStep: _currentStep, totalSteps: 2),
                  const Spacer(),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            const SizedBox(height: 28),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: VoiceAssistanceBanner(),
            ),
            const SizedBox(height: 16),

            // ─── PageView (no swipe) ──────────────────────────────────────
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ProfileIdentityStep(onNext: () => _goToStep(1)),
                  ProfilePreferencesStep(onSubmit: _handleSubmit),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StepIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const _StepIndicator({required this.currentStep, required this.totalSteps});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Étape ${currentStep + 1} sur $totalSteps',
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(totalSteps, (i) {
          final isActive = i == currentStep;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: isActive ? 24 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: isActive ? AppColors.primary : AppColors.borderSoft,
              borderRadius: BorderRadius.circular(4),
            ),
          );
        }),
      ),
    );
  }
}

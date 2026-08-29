import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../app/theme/app_colors.dart';
import '../viewmodels/register_viewmodel.dart';
import 'steps/register_identity_step.dart';
import 'steps/register_phone_step.dart';
import 'steps/register_otp_step.dart';
import 'steps/register_security_step.dart';
import '../../../../shared/widgets/accessibility/voice_assistance_banner.dart';
import '../../../../shared/widgets/feedback/app_loading_overlay.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final PageController _pageController = PageController();
  int _currentStep = 0;
  bool _isLoading = false;

  static const int _totalSteps = 4;

  void _nextStep() {
    if (_currentStep < _totalSteps - 1) {
      setState(() => _currentStep++);
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      if (mounted) {
        ref.read(registerViewModelProvider.notifier).resetRegistration();
        context.pop();
      }
    }
  }

  void _setLoading(bool loading) {
    setState(() => _isLoading = loading);
  }

  @override
  Widget build(BuildContext context) {
    return AppLoadingOverlay(
      isLoading: _isLoading,
      child: Scaffold(
        backgroundColor: AppColors.background,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Column(
            children: [
              // Header avec progression
              _RegisterHeader(
                currentStep: _currentStep,
                totalSteps: _totalSteps,
                onBack: _previousStep,
              ),
              // Bannière vocale compacte
              const VoiceAssistanceBanner(),
              // Contenu des étapes
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    RegisterIdentityStep(onNext: _nextStep),
                    RegisterPhoneStep(
                      onNext: () async {
                        _setLoading(true);
                        try {
                          await ref
                              .read(registerViewModelProvider.notifier)
                              .startRegistration();
                          _nextStep();
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(e.toString()),
                                backgroundColor: AppColors.error,
                              ),
                            );
                          }
                        } finally {
                          _setLoading(false);
                        }
                      },
                    ),
                    RegisterOtpStep(onNext: () async => _nextStep()),
                    RegisterSecurityStep(
                      onComplete: () async {
                        _setLoading(true);
                        try {
                          await ref
                              .read(registerViewModelProvider.notifier)
                              .completeRegistration();

                          if (context.mounted) {
                            ref
                                .read(registerViewModelProvider.notifier)
                                .resetRegistration();
                            context.go('/profile-setup');
                          }
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(e.toString()),
                                backgroundColor: AppColors.error,
                              ),
                            );
                          }
                        } finally {
                          _setLoading(false);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterHeader extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final VoidCallback onBack;

  const _RegisterHeader({
    required this.currentStep,
    required this.totalSteps,
    required this.onBack,
  });

  static const List<String> _stepLabels = [
    'Identité',
    'Téléphone',
    'Vérification',
    'Sécurité',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.fromLTRB(8, 8, 16, 12),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.secondary,
                  size: 20,
                ),
                onPressed: onBack,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Étape ${currentStep + 1} sur $totalSteps — ${_stepLabels[currentStep]}',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: (currentStep + 1) / totalSteps.toDouble(),
                backgroundColor: AppColors.primaryContainer,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.primary,
                ),
                minHeight: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

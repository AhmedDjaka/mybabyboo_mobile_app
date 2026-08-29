import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../shared/widgets/accessibility/voice_assistance_banner.dart';
import '../widgets/auth_hero_section.dart';
import '../widgets/social_login_button.dart';

class AuthWelcomePage extends StatelessWidget {
  const AuthWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final topHeight = mq.size.height * 0.40;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: topHeight + 32,
            child: const AuthHeroSection(
              tagline: 'Votre grossesse,\nvotre histoire,\navec douceur.',
            ),
          ),
          Positioned(
            top: topHeight,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.vertical(top: Radius.circular(36)),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  28,
                  20,
                  28,
                  40,
                ), // Réduit le top padding pour laisser place à la bannière
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Align(
                      alignment: Alignment.centerRight,
                      child: VoiceAssistanceBanner(),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Bienvenue dans votre espace',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Un accompagnement pensé pour vivre votre grossesse sereinement,\nà votre rythme.',
                      style: GoogleFonts.quicksand(
                        fontSize: 15,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 36),
                    FilledButton(
                      onPressed: () => context.push('/auth/register'),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        textStyle: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      child: const Text('Créer mon compte'),
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton(
                      onPressed: () => context.push('/auth/login'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.secondary,
                        side: const BorderSide(
                          color: AppColors.borderSoft,
                          width: 1.5,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        textStyle: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      child: const Text("J'ai déjà un compte"),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(color: AppColors.borderSoft),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'ou',
                            style: GoogleFonts.quicksand(
                              color: AppColors.textSecondary,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Divider(color: AppColors.borderSoft),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SocialLoginButton(
                      icon: Icons.g_mobiledata_rounded,
                      label: 'Continuer avec Google',
                      subtitle: 'Bientôt disponible',
                      onPressed: null,
                    ),
                    const SizedBox(height: 10),
                    SocialLoginButton(
                      icon: Icons.apple_rounded,
                      label: 'Continuer avec Apple',
                      subtitle: 'Bientôt disponible',
                      onPressed: null,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

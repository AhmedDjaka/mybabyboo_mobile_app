import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../shared/widgets/accessibility/voice_assistance_banner.dart';
import '../../../../shared/widgets/feedback/app_loading_overlay.dart';
import '../viewmodels/auth_viewmodel.dart';
import '../widgets/auth_hero_section.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/social_login_button.dart';
import '../../domain/entities/auth_session.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _phoneCtrl = TextEditingController();
  final _pwdCtrl = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _phoneCtrl.dispose();
    _pwdCtrl.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    setState(() => _isLoading = true);
    try {
      await ref
          .read(authViewModelProvider.notifier)
          .login(_phoneCtrl.text.trim(), _pwdCtrl.text);

      // Le routeur va automatiquement rediriger l'utilisateur vers
      // /profile-setup, /pregnancy-setup ou /home grâce au refreshListenable.
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final isKeyboardOpen = mq.viewInsets.bottom > 0;
    final topHeight = isKeyboardOpen
        ? mq.size.height * 0.15
        : mq.size.height * 0.40;

    ref.listen<AsyncValue<AuthSession?>>(authViewModelProvider, (
      previous,
      next,
    ) {
      if (!next.isLoading && next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error.toString()),
            backgroundColor: AppColors.error,
          ),
        );
      }
    });

    return AppLoadingOverlay(
      isLoading: _isLoading,
      child: Scaffold(
        backgroundColor: AppColors.surface,
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            // Background Hero (Image + Branding)
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              top: 0,
              left: 0,
              right: 0,
              height: topHeight + 36, // +36 pour overlap
              child: const AuthHeroSection(
                tagline: 'Ravis de\nvous revoir !',
                showBackButton: true,
              ),
            ),

            // Carte Formulaire blanche
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              top: topHeight,
              left: 0,
              right: 0,
              bottom: 0, // S'attache au-dessus du clavier grâce au Scaffold
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(36)),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(28, 20, 28, 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Align(
                        alignment: Alignment.centerRight,
                        child: VoiceAssistanceBanner(),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Ravie de vous revoir',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Connectez-vous pour retrouver votre suivi.',
                        style: GoogleFonts.quicksand(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 28),
                      AuthTextField(
                        controller: _phoneCtrl,
                        label: 'Téléphone ou adresse e-mail',
                        keyboardType: TextInputType.emailAddress,
                        autofillHints: const [
                          AutofillHints.telephoneNumber,
                          AutofillHints.email,
                        ],
                      ),
                      const SizedBox(height: 16),
                      AuthTextField(
                        controller: _pwdCtrl,
                        label: 'Mot de passe',
                        obscureText: _obscurePassword,
                        autofillHints: const [AutofillHints.password],
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: AppColors.textSecondary,
                          ),
                          onPressed: () => setState(
                            () => _obscurePassword = !_obscurePassword,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () =>
                              context.push('/auth/forgot-password'),
                          child: Text(
                            'Mot de passe oublié ?',
                            style: GoogleFonts.quicksand(
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      FilledButton(
                        onPressed: _isLoading ? null : _login,
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
                        child: const Text('Se connecter'),
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
                              'Ou continuer avec',
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
                      Row(
                        children: [
                          Expanded(
                            child: SocialLoginButton(
                              icon: Icons.g_mobiledata_rounded,
                              label: 'Google',
                              subtitle: 'Bientôt',
                              onPressed: null,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: SocialLoginButton(
                              icon: Icons.apple_rounded,
                              label: 'Apple',
                              subtitle: 'Bientôt',
                              onPressed: null,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Pas encore de compte ? ',
                            style: GoogleFonts.quicksand(
                              color: AppColors.textSecondary,
                              fontSize: 14,
                            ),
                          ),
                          TextButton(
                            onPressed: () => context.push('/auth/register'),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              'Créer mon compte',
                              style: GoogleFonts.quicksand(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

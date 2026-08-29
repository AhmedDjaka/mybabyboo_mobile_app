import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../app/theme/app_colors.dart';
import '../../viewmodels/register_viewmodel.dart';
import '../../widgets/auth_text_field.dart';
import '../../../../../shared/widgets/accessibility/voice_help_button.dart';

class RegisterSecurityStep extends ConsumerStatefulWidget {
  final VoidCallback onComplete;

  const RegisterSecurityStep({super.key, required this.onComplete});

  @override
  ConsumerState<RegisterSecurityStep> createState() =>
      _RegisterSecurityStepState();
}

class _RegisterSecurityStepState extends ConsumerState<RegisterSecurityStep> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _pwdCtrl = TextEditingController();
  bool _accepted = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _pwdCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate() && _accepted) {
      ref
          .read(registerViewModelProvider.notifier)
          .updateSecurity(_pwdCtrl.text, _emailCtrl.text.trim(), _accepted);
      widget.onComplete();
    } else if (!_accepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez accepter les conditions')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  24,
                  24,
                  24,
                  MediaQuery.viewInsetsOf(context).bottom + 24,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Dernière étape 🎉',
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                          VoiceHelpButton(
                            textToRead:
                                'Dernière étape. Entrez un mot de passe sécurisé et acceptez les conditions pour finaliser.',
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Créez un mot de passe sécurisé pour votre compte.',
                        style: GoogleFonts.quicksand(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 28),
                      AuthTextField(
                        controller: _emailCtrl,
                        label: 'Email (optionnel)',
                        keyboardType: TextInputType.emailAddress,
                        autofillHints: const [AutofillHints.email],
                      ),
                      const SizedBox(height: 16),
                      AuthTextField(
                        controller: _pwdCtrl,
                        label: 'Mot de passe',
                        obscureText: _obscurePassword,
                        autofillHints: const [AutofillHints.newPassword],
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
                        validator: (v) => v == null || v.length < 8
                            ? 'Minimum 8 caractères'
                            : null,
                      ),
                      const SizedBox(height: 20),
                      // Acceptation des CGU
                      GestureDetector(
                        onTap: () => setState(() => _accepted = !_accepted),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Checkbox(
                                value: _accepted,
                                activeColor: AppColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                onChanged: (val) =>
                                    setState(() => _accepted = val ?? false),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "J'accepte les Conditions Générales d'Utilisation et la Politique de Confidentialité de MyBabyBoo.",
                                style: GoogleFonts.quicksand(
                                  fontSize: 13,
                                  color: AppColors.textSecondary,
                                  fontWeight: FontWeight.w500,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(height: 24),
                      FilledButton(
                        onPressed: _submit,
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
                        child: const Text("Terminer l'inscription"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

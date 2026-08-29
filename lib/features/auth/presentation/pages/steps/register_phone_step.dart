import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../app/theme/app_colors.dart';
import '../../viewmodels/register_viewmodel.dart';
import '../../widgets/phone_input_field.dart';
import '../../../../../shared/widgets/accessibility/voice_help_button.dart';

class RegisterPhoneStep extends ConsumerStatefulWidget {
  final VoidCallback onNext;

  const RegisterPhoneStep({super.key, required this.onNext});

  @override
  ConsumerState<RegisterPhoneStep> createState() => _RegisterPhoneStepState();
}

class _RegisterPhoneStepState extends ConsumerState<RegisterPhoneStep> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _phoneCtrl;

  @override
  void initState() {
    super.initState();
    final draft = ref.read(registerViewModelProvider);
    _phoneCtrl = TextEditingController(
      text: draft.phone.isNotEmpty ? draft.phone : '+225',
    );
  }

  @override
  void dispose() {
    _phoneCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ref
          .read(registerViewModelProvider.notifier)
          .updatePhone(_phoneCtrl.text.trim());
      widget.onNext();
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
                              'Votre numéro de téléphone',
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                          VoiceHelpButton(
                            textToRead:
                                'Quel est votre numéro de téléphone ? Il sera utilisé pour sécuriser votre compte.',
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Il sera utilisé pour sécuriser votre compte et vous connecter facilement.",
                        style: GoogleFonts.quicksand(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 28),
                      PhoneInputField(
                        initialValue: _phoneCtrl.text,
                        onChanged: (val) {
                          _phoneCtrl.text = val;
                        },
                        validator: (v) {
                          if (v == null || v.isEmpty) return 'Requis';
                          if (v.length < 8) return 'Numéro invalide';
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      // Indication du numéro de test en mode debug
                      Semantics(
                        label: 'Astuce développeur',
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceSoft,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.borderSoft),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.info_outline_rounded,
                                size: 16,
                                color: AppColors.textSecondary,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Test : +225 07 00 00 00 00',
                                  style: GoogleFonts.quicksand(
                                    fontSize: 13,
                                    color: AppColors.textSecondary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                        child: const Text('Envoyer le code SMS'),
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

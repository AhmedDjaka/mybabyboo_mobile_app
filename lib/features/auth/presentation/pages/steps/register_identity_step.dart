import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../app/theme/app_colors.dart';
import '../../viewmodels/register_viewmodel.dart';
import '../../widgets/auth_text_field.dart';
import '../../../../../shared/widgets/accessibility/voice_help_button.dart';

class RegisterIdentityStep extends ConsumerStatefulWidget {
  final VoidCallback onNext;

  const RegisterIdentityStep({super.key, required this.onNext});

  @override
  ConsumerState<RegisterIdentityStep> createState() =>
      _RegisterIdentityStepState();
}

class _RegisterIdentityStepState extends ConsumerState<RegisterIdentityStep> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameCtrl;
  late TextEditingController _lastNameCtrl;

  @override
  void initState() {
    super.initState();
    final draft = ref.read(registerViewModelProvider);
    _firstNameCtrl = TextEditingController(text: draft.firstName);
    _lastNameCtrl = TextEditingController(text: draft.lastName);
  }

  @override
  void dispose() {
    _firstNameCtrl.dispose();
    _lastNameCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ref
          .read(registerViewModelProvider.notifier)
          .updateIdentity(
            _firstNameCtrl.text.trim(),
            _lastNameCtrl.text.trim(),
          );
      widget.onNext();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
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
                          'Faisons connaissance !',
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      const VoiceHelpButton(
                        textToRead:
                            'Faisons connaissance ! Veuillez entrer votre prénom et votre nom de famille.',
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Ces informations personnalisent votre expérience.',
                    style: GoogleFonts.quicksand(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 28),
                  AuthTextField(
                    controller: _firstNameCtrl,
                    label: 'Prénom',
                    autofillHints: const [AutofillHints.givenName],
                    textInputAction: TextInputAction.next,
                    validator: (v) => v == null || v.isEmpty ? 'Requis' : null,
                  ),
                  const SizedBox(height: 16),
                  AuthTextField(
                    controller: _lastNameCtrl,
                    label: 'Nom de famille',
                    autofillHints: const [AutofillHints.familyName],
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _submit(),
                    validator: (v) => v == null || v.isEmpty ? 'Requis' : null,
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
                    child: const Text('Continuer'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

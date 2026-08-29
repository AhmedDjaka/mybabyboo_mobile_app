import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/accessibility/voice_preferences_provider.dart';
import '../../../../core/audio/tts_service.dart';
import '../../../../shared/widgets/accessibility/voice_help_button.dart';
import '../../../../shared/widgets/app_button.dart';
import '../viewmodels/profile_setup_viewmodel.dart';
import '../widgets/birth_date_input_field.dart';

class ProfileIdentityStep extends ConsumerStatefulWidget {
  final VoidCallback onNext;

  const ProfileIdentityStep({super.key, required this.onNext});

  @override
  ConsumerState<ProfileIdentityStep> createState() =>
      _ProfileIdentityStepState();
}

class _ProfileIdentityStepState extends ConsumerState<ProfileIdentityStep> {
  late final TextEditingController _nameCtrl;
  late final FocusNode _nameFocus;
  late final FocusNode _birthDateFocus;

  bool _isDateValid = true;

  bool _hasSpokenName = false;
  bool _hasSpokenBirthDate = false;

  @override
  void initState() {
    super.initState();
    final vm = ref.read(profileSetupViewModelProvider);
    _nameCtrl = TextEditingController(text: vm.displayName);

    _nameFocus = FocusNode();
    _birthDateFocus = FocusNode();

    _nameFocus.addListener(_onNameFocusChanged);
    _birthDateFocus.addListener(_onBirthDateFocusChanged);
  }

  void _onNameFocusChanged() {
    if (_nameFocus.hasFocus && !_hasSpokenName) {
      _hasSpokenName = true;
      final voiceEnabled =
          ref.read(voicePreferencesProvider).valueOrNull ?? false;
      if (voiceEnabled) {
        ref
            .read(ttsServiceProvider)
            .speak(
              "Indiquez le prénom que vous souhaitez voir affiché dans MyBabyBoo.",
            );
      }
    }
  }

  void _onBirthDateFocusChanged() {
    if (_birthDateFocus.hasFocus && !_hasSpokenBirthDate) {
      _hasSpokenBirthDate = true;
      final voiceEnabled =
          ref.read(voicePreferencesProvider).valueOrNull ?? false;
      if (voiceEnabled) {
        ref
            .read(ttsServiceProvider)
            .speak(
              "Indiquez votre date de naissance. Cette information est facultative. Saisissez le jour, le mois et l'année, ou utilisez le calendrier.",
            );
      }
    }
  }

  @override
  void dispose() {
    _nameFocus.removeListener(_onNameFocusChanged);
    _birthDateFocus.removeListener(_onBirthDateFocusChanged);
    _nameFocus.dispose();
    _birthDateFocus.dispose();
    _nameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileSetupViewModelProvider);
    final vm = ref.read(profileSetupViewModelProvider.notifier);

    return Semantics(
      label: 'Étape 1 sur 2 : Identité personnalisée',
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(28, 0, 28, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Header ──────────────────────────────────────────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Comment souhaitez-vous\nqu\'on vous appelle ?',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                      height: 1.3,
                    ),
                  ),
                ),
                VoiceHelpButton(
                  textToRead:
                      'Comment souhaitez-vous que MyBabyBoo vous appelle ? '
                      'Vous pouvez conserver votre prénom ou le modifier.',
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Pour rendre MyBabyBoo encore plus personnel.',
              style: GoogleFonts.quicksand(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 36),

            // ─── Prénom d'affichage ──────────────────────────────────────
            Text(
              'Prénom d\'affichage',
              style: GoogleFonts.quicksand(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _nameCtrl,
              focusNode: _nameFocus,
              onChanged: vm.setDisplayName,
              textCapitalization: TextCapitalization.words,
              style: GoogleFonts.quicksand(
                fontSize: 16,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                hintText: 'Aïcha',
                hintStyle: GoogleFonts.quicksand(color: AppColors.disabled),
                filled: true,
                fillColor: AppColors.surface,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: AppColors.borderSoft),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 1.5,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.person_outline,
                  color: AppColors.primary,
                  size: 20,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
              ),
            ),
            const SizedBox(height: 36),

            // ─── Date de naissance (facultatif) ─────────────────────────
            Row(
              children: [
                Text(
                  'Date de naissance',
                  style: GoogleFonts.quicksand(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Facultatif',
                    style: GoogleFonts.quicksand(
                      fontSize: 11,
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            BirthDateInputField(
              initialDate: state.birthDate,
              focusNode: _birthDateFocus,
              onChanged: (date, isValid) {
                vm.setBirthDate(date);
                setState(() => _isDateValid = isValid);
              },
            ),
            const SizedBox(height: 48),

            // ─── CTA ─────────────────────────────────────────────────────
            SizedBox(
              width: double.infinity,
              height: 52,
              child: AppButton(
                text: 'Continuer',
                onPressed: (state.displayName.isNotEmpty && _isDateValid)
                    ? widget.onNext
                    : () {},
                isDisabled: state.displayName.isEmpty || !_isDateValid,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

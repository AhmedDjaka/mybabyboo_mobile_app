import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/accessibility/voice_preferences_provider.dart';
import '../../../../core/audio/tts_service.dart';
import '../../../../shared/widgets/accessibility/voice_help_button.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/feedback/app_loading_overlay.dart';
import '../viewmodels/profile_setup_viewmodel.dart';
import '../../domain/entities/country.dart';
import '../../data/repositories/reference_repository_impl.dart';

class ProfilePreferencesStep extends ConsumerStatefulWidget {
  final VoidCallback onSubmit;

  const ProfilePreferencesStep({super.key, required this.onSubmit});

  @override
  ConsumerState<ProfilePreferencesStep> createState() =>
      _ProfilePreferencesStepState();
}

class _ProfilePreferencesStepState
    extends ConsumerState<ProfilePreferencesStep> {
  late final TextEditingController _cityCtrl;
  late final FocusNode _cityFocus;
  bool _hasSpokenCity = false;

  List<Country> _countries = [];
  bool _isLoadingCountries = true;

  @override
  void initState() {
    super.initState();
    final state = ref.read(profileSetupViewModelProvider);
    _cityCtrl = TextEditingController(text: state.city);
    _cityFocus = FocusNode();
    _cityFocus.addListener(_onCityFocusChanged);

    _loadCountries();
  }

  Future<void> _loadCountries() async {
    try {
      final repo = ref.read(referenceRepositoryProvider);
      final countries = await repo.getCountries();
      setState(() {
        _countries = countries;
        _isLoadingCountries = false;
      });
    } catch (e) {
      // Fallback
      setState(() {
        _countries = [
          const Country(isoCode: 'CI', name: "Côte d'Ivoire", dialCode: '+225'),
          const Country(isoCode: 'SN', name: "Sénégal", dialCode: '+221'),
        ];
        _isLoadingCountries = false;
      });
    }
  }

  void _onCityFocusChanged() {
    if (_cityFocus.hasFocus && !_hasSpokenCity) {
      _hasSpokenCity = true;
      final voiceEnabled =
          ref.read(voicePreferencesProvider).valueOrNull ?? false;
      if (voiceEnabled) {
        ref
            .read(ttsServiceProvider)
            .speak(
              "Dans quelle ville habitez-vous ? Cette information est facultative.",
            );
      }
    }
  }

  @override
  void dispose() {
    _cityFocus.removeListener(_onCityFocusChanged);
    _cityFocus.dispose();
    _cityCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileSetupViewModelProvider);
    final vm = ref.read(profileSetupViewModelProvider.notifier);

    return Semantics(
      label: 'Étape 2 sur 2 : Préférences',
      child: AppLoadingOverlay(
        isLoading: state.isLoading || _isLoadingCountries,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(28, 0, 28, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ─── Header ────────────────────────────────────────────────
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Quelques préférences\npour vous',
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
                        'Vous pouvez indiquer votre pays et votre ville, et choisir si vous souhaitez utiliser l\'aide vocale.',
                  ),
                ],
              ),
              const SizedBox(height: 36),

              // ─── Pays ───────────────────────────────────────────────────
              Text(
                'Pays',
                style: GoogleFonts.quicksand(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Semantics(
                label: 'Sélectionner votre pays',
                child: DropdownButtonFormField<String>(
                  initialValue:
                      _countries.any((c) => c.isoCode == state.countryCode)
                      ? state.countryCode
                      : null,
                  decoration: InputDecoration(
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
                      Icons.flag_outlined,
                      color: AppColors.primary,
                      size: 20,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  style: GoogleFonts.quicksand(
                    fontSize: 15,
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                  dropdownColor: AppColors.surface,
                  borderRadius: BorderRadius.circular(14),
                  items: _countries
                      .map(
                        (c) => DropdownMenuItem(
                          value: c.isoCode,
                          child: Text(c.name),
                        ),
                      )
                      .toList(),
                  onChanged: (v) {
                    if (v != null) vm.setCountryCode(v);
                  },
                ),
              ),
              const SizedBox(height: 24),

              // ─── Ville (facultatif) ──────────────────────────────────────
              Row(
                children: [
                  Text(
                    'Ville',
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
              Autocomplete<String>(
                initialValue: TextEditingValue(text: state.city),
                optionsBuilder: (TextEditingValue textEditingValue) async {
                  if (textEditingValue.text.isEmpty) {
                    return const Iterable<String>.empty();
                  }
                  try {
                    final repo = ref.read(referenceRepositoryProvider);
                    return await repo.searchCities(
                      state.countryCode,
                      textEditingValue.text,
                    );
                  } catch (e) {
                    return const Iterable<String>.empty();
                  }
                },
                onSelected: (String selection) {
                  _cityCtrl.text = selection;
                  vm.setCity(selection);
                },
                fieldViewBuilder:
                    (
                      context,
                      textEditingController,
                      focusNode,
                      onFieldSubmitted,
                    ) {
                      return Focus(
                        onFocusChange: (hasFocus) {
                          if (hasFocus && !_hasSpokenCity) {
                            _hasSpokenCity = true;
                            final voiceEnabled =
                                ref
                                    .read(voicePreferencesProvider)
                                    .valueOrNull ??
                                false;
                            if (voiceEnabled) {
                              ref
                                  .read(ttsServiceProvider)
                                  .speak(
                                    "Dans quelle ville habitez-vous ? Cette information est facultative.",
                                  );
                            }
                          }
                        },

                        child: TextFormField(
                          controller: textEditingController,
                          focusNode: focusNode,
                          onChanged: (val) {
                            vm.setCity(val);
                          },
                          textCapitalization: TextCapitalization.words,
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Abidjan',
                            hintStyle: GoogleFonts.quicksand(
                              color: AppColors.disabled,
                            ),
                            filled: true,
                            fillColor: AppColors.surface,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(
                                color: AppColors.borderSoft,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(
                                color: AppColors.primary,
                                width: 1.5,
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.location_city_outlined,
                              color: AppColors.primary,
                              size: 20,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                          ),
                        ),
                      );
                    },
              ),
              const SizedBox(height: 36),

              if (state.error != null) ...[
                const SizedBox(height: 16),
                Text(
                  state.error!,
                  style: GoogleFonts.quicksand(
                    color: AppColors.error,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],

              const SizedBox(height: 48),

              // ─── CTA ─────────────────────────────────────────────────────
              SizedBox(
                width: double.infinity,
                height: 52,
                child: AppButton(
                  text: 'Terminer',
                  onPressed: state.isLoading ? () {} : widget.onSubmit,
                  isLoading: state.isLoading,
                  isDisabled: state.isLoading,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

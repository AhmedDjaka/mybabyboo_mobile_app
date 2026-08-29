import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodels/pregnancy_setup_viewmodel.dart';
import '../../../../shared/widgets/app_button.dart';

import '../../../../shared/widgets/accessibility/voice_help_button.dart';
import '../../../../core/accessibility/voice_preferences_provider.dart';
import '../../../../core/audio/tts_service.dart';

class PregnancyLmpStep extends ConsumerStatefulWidget {
  const PregnancyLmpStep({super.key});

  @override
  ConsumerState<PregnancyLmpStep> createState() => _PregnancyLmpStepState();
}

class _PregnancyLmpStepState extends ConsumerState<PregnancyLmpStep> {
  bool _hasSpoken = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_hasSpoken) {
        _hasSpoken = true;
        final voiceEnabled =
            ref.read(voicePreferencesProvider).valueOrNull ?? false;
        if (voiceEnabled) {
          ref
              .read(ttsServiceProvider)
              .speak(
                "Quel était le premier jour de vos dernières règles ? Sélectionnez la date dans le calendrier pour estimer votre terme.",
              );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(pregnancySetupViewModelProvider);
    final viewModel = ref.read(pregnancySetupViewModelProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Quel était le premier jour de vos dernières règles ?',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  VoiceHelpButton(
                    textToRead:
                        "Saisissez la date de vos dernières règles. Cela nous permettra de calculer une date prévue d'accouchement.",
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Nous allons calculer une DPA estimée.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 32),

              InkWell(
                onTap: () async {
                  final now = DateTime.now();
                  final picked = await showDatePicker(
                    context: context,
                    initialDate:
                        state.lmpDate ?? now.subtract(const Duration(days: 30)),
                    firstDate: now.subtract(const Duration(days: 300)),
                    lastDate: now,
                  );
                  if (picked != null) {
                    viewModel.setLmpDate(picked);
                  }
                },
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Date (LMP)',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  child: Text(
                    state.lmpDate != null
                        ? '${state.lmpDate!.day.toString().padLeft(2, '0')}/${state.lmpDate!.month.toString().padLeft(2, '0')}/${state.lmpDate!.year}'
                        : 'Sélectionner une date',
                  ),
                ),
              ),

              const SizedBox(height: 32),
              Text(
                'Cette estimation pourra être mise à jour avec la date communiquée par votre professionnel de santé.',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
        if (state.error != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Text(
              state.error!,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: viewModel.previousStep,
                  child: const Text('Retour'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: AppButton(
                  text: 'Continuer',
                  onPressed: state.lmpDate != null ? viewModel.nextStep : () {},
                  isDisabled: state.lmpDate == null,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

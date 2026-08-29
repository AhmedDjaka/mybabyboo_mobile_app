import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodels/pregnancy_setup_viewmodel.dart';
import '../../../../shared/widgets/app_button.dart';

import '../../../../shared/widgets/accessibility/voice_help_button.dart';
import '../../../../core/accessibility/voice_preferences_provider.dart';
import '../../../../core/audio/tts_service.dart';

class PregnancyUnknownDateStep extends ConsumerStatefulWidget {
  const PregnancyUnknownDateStep({super.key});

  @override
  ConsumerState<PregnancyUnknownDateStep> createState() =>
      _PregnancyUnknownDateStepState();
}

class _PregnancyUnknownDateStepState
    extends ConsumerState<PregnancyUnknownDateStep> {
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
                "Ce n'est pas grave. Vous pourrez ajouter cette information plus tard, lorsque votre professionnel de santé vous aura communiqué votre date.",
              );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                      'Ce n\'est pas grave 💕',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  VoiceHelpButton(
                    textToRead:
                        "Vous pourrez ajouter cette information plus tard, lorsque votre professionnel de santé vous aura communiqué votre date.",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Vous pourrez ajouter cette information plus tard, lorsque votre professionnel de santé vous aura communiqué votre date.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
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
                  onPressed: viewModel.nextStep,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

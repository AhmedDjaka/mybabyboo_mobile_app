import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodels/pregnancy_setup_viewmodel.dart';
import '../../../../shared/widgets/app_button.dart';

import '../../../../shared/widgets/accessibility/voice_help_button.dart';
import '../../../../core/accessibility/voice_preferences_provider.dart';
import '../../../../core/audio/tts_service.dart';

class PregnancyDueDateStep extends ConsumerStatefulWidget {
  const PregnancyDueDateStep({super.key});

  @override
  ConsumerState<PregnancyDueDateStep> createState() =>
      _PregnancyDueDateStepState();
}

class _PregnancyDueDateStepState extends ConsumerState<PregnancyDueDateStep> {
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
                "Quelle date vous a-t-on indiquée ? Sélectionnez votre date prévue d'accouchement dans le calendrier.",
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
                      'Quelle date vous a-t-on indiquée ?',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  VoiceHelpButton(
                    textToRead:
                        "Saisissez la date communiquée par votre médecin ou sage-femme.",
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Date communiquée par un professionnel de santé.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 32),

              InkWell(
                onTap: () async {
                  final now = DateTime.now();
                  final picked = await showDatePicker(
                    context: context,
                    initialDate:
                        state.professionalDueDate ??
                        now.add(const Duration(days: 200)),
                    firstDate: now,
                    lastDate: now.add(const Duration(days: 300)),
                  );
                  if (picked != null) {
                    viewModel.setProfessionalDueDate(picked);
                  }
                },
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Date prévue d\'accouchement (DPA)',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  child: Text(
                    state.professionalDueDate != null
                        ? '${state.professionalDueDate!.day.toString().padLeft(2, '0')}/${state.professionalDueDate!.month.toString().padLeft(2, '0')}/${state.professionalDueDate!.year}'
                        : 'Sélectionner une date',
                  ),
                ),
              ),

              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.info_outline, color: Colors.blue),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Si votre grossesse est issue d\'une PMA/FIV, utilisez de préférence la date prévue d\'accouchement communiquée par votre équipe médicale.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.blue.shade900,
                        ),
                      ),
                    ),
                  ],
                ),
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
                  onPressed: state.professionalDueDate != null
                      ? viewModel.nextStep
                      : () {},
                  isDisabled: state.professionalDueDate == null,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

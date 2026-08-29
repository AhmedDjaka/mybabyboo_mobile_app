import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/pregnancy_dating_method.dart';
import '../viewmodels/pregnancy_setup_viewmodel.dart';
import '../widgets/dating_method_card.dart';
import '../../../../shared/widgets/app_button.dart';

import '../../../../shared/widgets/accessibility/voice_help_button.dart';
import '../../../../core/accessibility/voice_preferences_provider.dart';
import '../../../../core/audio/tts_service.dart';

class PregnancyDatingChoiceStep extends ConsumerStatefulWidget {
  const PregnancyDatingChoiceStep({super.key});

  @override
  ConsumerState<PregnancyDatingChoiceStep> createState() =>
      _PregnancyDatingChoiceStepState();
}

class _PregnancyDatingChoiceStepState
    extends ConsumerState<PregnancyDatingChoiceStep> {
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
                "Pour mieux vous accompagner, dites-nous simplement ce que vous savez déjà sur votre grossesse. "
                "Sélectionnez une des trois situations proposées.",
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
                      '3 situations de datation',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  VoiceHelpButton(
                    textToRead:
                        "Sélectionnez la situation qui correspond à ce que vous savez déjà sur votre grossesse.",
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Pour mieux vous accompagner, dites-nous simplement ce que vous savez déjà sur votre grossesse.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 32),

              DatingMethodCard(
                title: "J'ai une date prévue d'accouchement",
                description:
                    "Donnée par mon médecin, ma sage-femme ou lors d'une échographie.",
                isSelected:
                    state.selectedMethod ==
                    PregnancyDatingMethod.professionalDueDate,
                onTap: () => viewModel.selectMethod(
                  PregnancyDatingMethod.professionalDueDate,
                ),
              ),

              DatingMethodCard(
                title: "Je connais le premier jour de mes dernières règles",
                description:
                    "L'application calculera une estimation de votre date prévue d'accouchement.",
                isSelected:
                    state.selectedMethod ==
                    PregnancyDatingMethod.lastMenstrualPeriod,
                onTap: () => viewModel.selectMethod(
                  PregnancyDatingMethod.lastMenstrualPeriod,
                ),
              ),

              DatingMethodCard(
                title: "Je ne connais pas encore ces dates",
                description: "Vous pourrez ajouter ces informations plus tard.",
                isSelected:
                    state.selectedMethod == PregnancyDatingMethod.unknown,
                onTap: () =>
                    viewModel.selectMethod(PregnancyDatingMethod.unknown),
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
          child: AppButton(
            text: 'Continuer',
            onPressed: state.selectedMethod != null
                ? viewModel.nextStep
                : () {},
            isDisabled: state.selectedMethod == null,
          ),
        ),
      ],
    );
  }
}

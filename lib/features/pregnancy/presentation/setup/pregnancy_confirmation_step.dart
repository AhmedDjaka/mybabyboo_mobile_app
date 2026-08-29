import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/pregnancy_dating_method.dart';
import '../../domain/services/pregnancy_dating_calculator.dart';
import '../viewmodels/pregnancy_setup_viewmodel.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/accessibility/voice_help_button.dart';

class PregnancyConfirmationStep extends ConsumerWidget {
  final bool isEditMode;
  const PregnancyConfirmationStep({super.key, this.isEditMode = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pregnancySetupViewModelProvider);
    final viewModel = ref.read(pregnancySetupViewModelProvider.notifier);

    String title = '';
    String? dateStr;
    String? gestationalAgeStr;
    String? disclaimer;

    final method = state.selectedMethod;

    if (method == PregnancyDatingMethod.professionalDueDate &&
        state.professionalDueDate != null) {
      title = 'Votre date prévue d\'accouchement';
      final d = state.professionalDueDate!;
      dateStr =
          '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';

      final age = PregnancyDatingCalculator.calculateGestationalAge(
        state.professionalDueDate,
      );
      if (age != null) {
        gestationalAgeStr = '${age['weeks']} SA + ${age['days']}';
      }
    } else if (method == PregnancyDatingMethod.lastMenstrualPeriod &&
        state.lmpDate != null) {
      title = 'Votre DPA estimée';
      final d = PregnancyDatingCalculator.calculateDueDateFromLmp(
        state.lmpDate!,
      );
      dateStr =
          '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}/${d.year}';

      final age = PregnancyDatingCalculator.calculateGestationalAge(d);
      if (age != null) {
        gestationalAgeStr = '${age['weeks']} SA + ${age['days']}';
      }
      disclaimer =
          'Cette estimation pourra être mise à jour avec la date communiquée par votre professionnel de santé.';
    } else if (method == PregnancyDatingMethod.unknown) {
      title = 'Votre espace grossesse est prêt.';
      disclaimer =
          'Vous pourrez ajouter votre date prévue d\'accouchement plus tard.';
    }

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
                      title,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  VoiceHelpButton(textToRead: title),
                ],
              ),
              const SizedBox(height: 32),

              if (dateStr != null) ...[
                Text(
                  dateStr,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
              ],

              if (gestationalAgeStr != null) ...[
                Text(
                  'Âge gestationnel : $gestationalAgeStr',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
              ],

              if (disclaimer != null)
                Text(
                  disclaimer,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
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
                  onPressed: state.isLoading ? null : viewModel.previousStep,
                  child: const Text('Retour'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: AppButton(
                  text: 'Terminer',
                  isLoading: state.isLoading,
                  onPressed: state.isLoading
                      ? () {}
                      : () async {
                          final success = await viewModel.submitSetup(
                            isEditMode: isEditMode,
                          );
                          if (success && context.mounted) {
                            if (isEditMode) {
                              // Pop the edit page and go back to home or where it was
                              Navigator.of(context).pop();
                              // We could also trigger a refresh on the home page but riverpod / pulling will do it,
                              // or we can invalidate homeViewModelProvider. Let's do that cleanly via a pop.
                            }
                          }
                        },
                  isDisabled: state.isLoading,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

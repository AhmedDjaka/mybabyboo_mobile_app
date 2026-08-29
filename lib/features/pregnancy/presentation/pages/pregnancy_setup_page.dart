import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/widgets/feedback/app_loading_overlay.dart';
import '../../../../shared/widgets/accessibility/voice_assistance_banner.dart';
import '../../domain/entities/pregnancy_dating_method.dart';
import '../viewmodels/pregnancy_setup_viewmodel.dart';
import '../setup/pregnancy_confirmation_step.dart';
import '../setup/pregnancy_dating_choice_step.dart';
import '../setup/pregnancy_due_date_step.dart';
import '../setup/pregnancy_lmp_step.dart';
import '../setup/pregnancy_unknown_date_step.dart';

class PregnancySetupPage extends ConsumerWidget {
  final bool isEditMode;
  const PregnancySetupPage({super.key, this.isEditMode = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pregnancySetupViewModelProvider);

    Widget stepWidget;
    if (state.currentStep == 0) {
      stepWidget = const PregnancyDatingChoiceStep();
    } else if (state.currentStep == 1) {
      if (state.selectedMethod == PregnancyDatingMethod.professionalDueDate) {
        stepWidget = const PregnancyDueDateStep();
      } else if (state.selectedMethod ==
          PregnancyDatingMethod.lastMenstrualPeriod) {
        stepWidget = const PregnancyLmpStep();
      } else {
        stepWidget = const PregnancyUnknownDateStep();
      }
    } else {
      stepWidget = PregnancyConfirmationStep(isEditMode: isEditMode);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Ma grossesse')),
      body: AppLoadingOverlay(
        isLoading: state.isLoading,
        child: Column(
          children: [
            const VoiceAssistanceBanner(),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: KeyedSubtree(
                  key: ValueKey(state.currentStep),
                  child: stepWidget,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

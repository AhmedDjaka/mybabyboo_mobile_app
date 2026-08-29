import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/pregnancy_dating_method.dart';
import '../../domain/repositories/pregnancy_repository.dart';
import '../providers/pregnancy_providers.dart';
import '../state/pregnancy_setup_state.dart';
import '../../../../features/auth/presentation/viewmodels/auth_viewmodel.dart';
import '../../../../core/errors/api_exception.dart';

class PregnancySetupViewModel extends Notifier<PregnancySetupState> {
  late PregnancyRepository _repository;

  @override
  PregnancySetupState build() {
    _repository = ref.watch(pregnancyRepositoryProvider);
    return const PregnancySetupState();
  }

  void selectMethod(PregnancyDatingMethod method) {
    state = state.copyWith(selectedMethod: method, error: null);
  }

  void setLmpDate(DateTime date) {
    state = state.copyWith(lmpDate: date, error: null);
  }

  void setProfessionalDueDate(DateTime date) {
    state = state.copyWith(professionalDueDate: date, error: null);
  }

  void nextStep() {
    state = state.copyWith(currentStep: state.currentStep + 1);
  }

  void previousStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  Future<bool> submitSetup({bool isEditMode = false}) async {
    final method = state.selectedMethod;
    if (method == null) {
      state = state.copyWith(error: 'Veuillez sélectionner une méthode.');
      return false;
    }

    if (method == PregnancyDatingMethod.lastMenstrualPeriod &&
        state.lmpDate == null) {
      state = state.copyWith(
        error: 'Veuillez sélectionner la date de vos dernières règles.',
      );
      return false;
    }

    if (method == PregnancyDatingMethod.professionalDueDate &&
        state.professionalDueDate == null) {
      state = state.copyWith(error: 'Veuillez sélectionner votre DPA.');
      return false;
    }

    state = state.copyWith(isLoading: true, error: null);

    try {
      if (isEditMode) {
        await _repository.updateCurrentPregnancy(
          datingMethod: method,
          lmpDate: state.lmpDate,
          dueDate: state.professionalDueDate,
        );
      } else {
        await _repository.setupPregnancy(
          datingMethod: method,
          lmpDate: state.lmpDate,
          dueDate: state.professionalDueDate,
        );
      }

      // Update session state
      await ref.read(authViewModelProvider.notifier).markPregnancyConfigured();
      ref.invalidate(currentPregnancyProvider);

      state = state.copyWith(isLoading: false);
      return true;
    } on ApiException catch (e) {
      String errorMessage = e.message;
      if (e.statusCode == 409) {
        errorMessage = "Une grossesse est déjà configurée sur votre compte.";
      }

      state = state.copyWith(isLoading: false, error: errorMessage);
      return false;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: "Une erreur s'est produite lors de la configuration.",
      );
      return false;
    }
  }
}

final pregnancySetupViewModelProvider =
    NotifierProvider<PregnancySetupViewModel, PregnancySetupState>(() {
      return PregnancySetupViewModel();
    });

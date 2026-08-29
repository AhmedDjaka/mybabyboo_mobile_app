import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/pregnancy_dating_method.dart';

part 'pregnancy_setup_state.freezed.dart';

@freezed
abstract class PregnancySetupState with _$PregnancySetupState {
  const factory PregnancySetupState({
    @Default(0) int currentStep,
    PregnancyDatingMethod? selectedMethod,
    DateTime? lmpDate,
    DateTime? professionalDueDate,
    @Default(false) bool isLoading,
    String? error,
  }) = _PregnancySetupState;
}

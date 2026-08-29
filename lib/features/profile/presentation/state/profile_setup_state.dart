import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_setup_state.freezed.dart';

@freezed
abstract class ProfileSetupState with _$ProfileSetupState {
  const factory ProfileSetupState({
    @Default('') String displayName,
    DateTime? birthDate,
    @Default('CI') String countryCode,
    @Default('') String city,
    @Default('fr') String locale,
    @Default(false) bool voiceAssistanceEnabled,
    @Default(false) bool isLoading,
    String? error,
    @Default(false) bool isSuccess,
  }) = _ProfileSetupState;
}

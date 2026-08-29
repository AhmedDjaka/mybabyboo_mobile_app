import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../features/auth/domain/entities/auth_user.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../../../../features/auth/presentation/viewmodels/auth_viewmodel.dart';
import '../state/profile_setup_state.dart';

part 'profile_setup_viewmodel.g.dart';

@riverpod
class ProfileSetupViewModel extends _$ProfileSetupViewModel {
  @override
  ProfileSetupState build() => const ProfileSetupState();

  // ─── Setters ─────────────────────────────────────────────────────────────

  void setDisplayName(String value) =>
      state = state.copyWith(displayName: value.trim(), error: null);

  void setBirthDate(DateTime? value) =>
      state = state.copyWith(birthDate: value, error: null);

  void setCountryCode(String value) =>
      state = state.copyWith(countryCode: value, error: null);

  void setCity(String value) =>
      state = state.copyWith(city: value.trim(), error: null);

  void setLocale(String value) =>
      state = state.copyWith(locale: value, error: null);

  void setVoiceAssistance(bool value) =>
      state = state.copyWith(voiceAssistanceEnabled: value, error: null);

  /// Prérempli depuis AuthUser.firstName ou AuthUser.name en fallback.
  void prefillFromAuthUser(AuthUser authUser) {
    String firstName = '';
    if (authUser.firstName != null && authUser.firstName!.isNotEmpty) {
      firstName = authUser.firstName!;
    } else {
      firstName = authUser.name.trim().split(' ').first;
    }

    if (state.displayName.isEmpty) {
      state = state.copyWith(displayName: firstName);
    }
  }

  // ─── Validation ──────────────────────────────────────────────────────────

  bool get isStep1Valid => state.displayName.isNotEmpty;

  bool get isStep2Valid =>
      state.countryCode.isNotEmpty && state.locale.isNotEmpty;

  // ─── Submit ──────────────────────────────────────────────────────────────

  Future<bool> submit() async {
    if (!isStep1Valid || !isStep2Valid) {
      state = state.copyWith(
        error: 'Veuillez remplir les champs obligatoires.',
      );
      return false;
    }

    state = state.copyWith(isLoading: true, error: null);
    try {
      final repository = ref.read(profileRepositoryProvider);
      await repository.updateProfile(
        displayName: state.displayName,
        birthDate: state.birthDate,
        countryCode: state.countryCode,
        city: state.city.isNotEmpty ? state.city : null,
        locale: state.locale,
        voiceAssistanceEnabled: state.voiceAssistanceEnabled,
      );

      // Update session state so Router redirects to next step
      await ref.read(authViewModelProvider.notifier).markProfileCompleted();

      state = state.copyWith(isLoading: false, isSuccess: true);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Une erreur est survenue. Veuillez réessayer.',
      );
      return false;
    }
  }
}

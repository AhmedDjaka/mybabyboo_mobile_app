import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/registration_draft.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../../../core/errors/api_error_mapper.dart';
import 'auth_viewmodel.dart';

part 'register_viewmodel.g.dart';

@Riverpod(keepAlive: true)
class RegisterViewModel extends _$RegisterViewModel {
  @override
  RegistrationDraft build() {
    return const RegistrationDraft();
  }

  void resetRegistration() {
    state = const RegistrationDraft();
  }

  void updateIdentity(String firstName, String lastName) {
    state = state.copyWith(firstName: firstName, lastName: lastName);
  }

  void updatePhone(String phone) {
    state = state.copyWith(phone: phone);
  }

  void updateSecurity(String password, String email, bool acceptedTerms) {
    state = state.copyWith(
      password: password,
      email: email,
      acceptedTerms: acceptedTerms,
    );
  }

  Future<void> startRegistration() async {
    try {
      final repository = ref.read(authRepositoryProvider);
      final result = await repository.startRegistration(state.phone);

      state = state.copyWith(
        verificationId: result['verification_id'],
        destinationMasked: result['destination_masked'],
        expiresIn: result['expires_in'],
      );
    } catch (e) {
      throw ApiErrorMapper.map(e);
    }
  }

  Future<void> verifyOtp(String code) async {
    try {
      final repository = ref.read(authRepositoryProvider);
      final token = await repository.verifyRegistration(
        state.verificationId,
        code,
      );
      state = state.copyWith(verificationToken: token);
    } catch (e) {
      throw ApiErrorMapper.map(e);
    }
  }

  Future<void> resendOtp() async {
    try {
      final repository = ref.read(authRepositoryProvider);
      final result = await repository.resendRegistrationOtp(
        state.verificationId,
      );

      state = state.copyWith(verificationId: result['verification_id']);
    } catch (e) {
      throw ApiErrorMapper.map(e);
    }
  }

  Future<void> completeRegistration() async {
    try {
      final repository = ref.read(authRepositoryProvider);
      // Let completeRegistration update the token, but we should login to fetch session
      // Wait, let's look at AuthRepository
      await repository.completeRegistration(state);

      // We need the full session. Since login does fetchSession, let's just trigger AuthViewModel to re-init
      // or we can manually create a session since a new user has no profile or pregnancy.
      // The easiest is to trigger a login state refresh.
      ref.invalidate(authViewModelProvider);

      // We don't set state directly here because we want AuthViewModel to fetch the session properly.
    } catch (e) {
      throw ApiErrorMapper.map(e);
    }
  }
}

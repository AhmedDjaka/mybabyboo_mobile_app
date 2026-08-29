import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/auth_user.dart';
import '../../domain/entities/registration_draft.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../../../../core/storage/secure_storage_service.dart';

import '../../domain/entities/auth_session.dart';

part 'auth_repository_impl.g.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final SecureStorageService _storageService;

  AuthRepositoryImpl(this._remoteDataSource, this._storageService);

  @override
  Future<Map<String, dynamic>> startRegistration(String phone) async {
    return await _remoteDataSource.startRegistration(phone);
  }

  @override
  Future<String> verifyRegistration(String verificationId, String code) async {
    return await _remoteDataSource.verifyRegistration(verificationId, code);
  }

  @override
  Future<Map<String, dynamic>> resendRegistrationOtp(
    String verificationId,
  ) async {
    return await _remoteDataSource.resendRegistrationOtp(verificationId);
  }

  @override
  Future<AuthUser> completeRegistration(RegistrationDraft draft) async {
    final response = await _remoteDataSource.completeRegistration(draft);
    final user = AuthUser.fromJson(response['user']);
    await _storageService.saveToken(response['access_token']);
    return user;
  }

  @override
  Future<AuthSession> fetchSession() async {
    final meData = await _remoteDataSource.me();
    return AuthSession(
      user: AuthUser.fromJson(meData['user']),
      profileCompleted: meData['profile_completed'] == true,
      pregnancyConfigured: meData['pregnancy_configured'] == true,
    );
  }

  @override
  Future<AuthSession> login(String phone, String password) async {
    final response = await _remoteDataSource.login(phone, password);
    await _storageService.saveToken(response['access_token']);
    // After storing the token, fetch the session to get the full state
    return await fetchSession();
  }

  @override
  Future<void> logout() async {
    await _storageService.deleteToken();
    // API call for logout could be added here
  }

  @override
  Future<void> forgotPassword(String phone) async {
    await _remoteDataSource.forgotPassword(phone);
  }

  @override
  Future<void> verifyPasswordReset(String phone, String code) async {
    await _remoteDataSource.verifyPasswordReset(phone, code);
  }

  @override
  Future<void> resetPassword(String phone, String password) async {
    await _remoteDataSource.resetPassword(phone, password);
  }

  @override
  Future<bool> checkProfileCompleted() async {
    final data = await _remoteDataSource.me();
    return data['profile_completed'] == true;
  }

  @override
  Future<bool> checkPregnancyConfigured() async {
    final data = await _remoteDataSource.me();
    return data['pregnancy_configured'] == true;
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(
    ref.watch(authRemoteDataSourceProvider),
    ref.watch(secureStorageServiceProvider),
  );
}

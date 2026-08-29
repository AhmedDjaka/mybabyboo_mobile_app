import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/auth_session.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../../../core/errors/api_error_mapper.dart';
import '../../../../core/storage/secure_storage_service.dart';

part 'auth_viewmodel.g.dart';

@Riverpod(keepAlive: true)
class AuthViewModel extends _$AuthViewModel {
  @override
  AsyncValue<AuthSession?> build() {
    _init();
    return const AsyncValue.loading();
  }

  Future<void> _init() async {
    final storage = ref.read(secureStorageServiceProvider);
    final token = await storage.getToken();

    if (token != null) {
      try {
        final repository = ref.read(authRepositoryProvider);
        final session = await repository.fetchSession();
        state = AsyncValue.data(session);
      } catch (e) {
        // En cas d'erreur (ex: 401 expiré), le token est nettoyé par l'interceptor,
        // mais on s'assure qu'on le nettoie ici aussi si besoin.
        await storage.deleteToken();
        state = const AsyncValue.data(null);
      }
    } else {
      state = const AsyncValue.data(null);
    }
  }

  Future<void> login(String phone, String password) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(authRepositoryProvider);
      final session = await repository.login(phone, password);
      state = AsyncValue.data(session);
    } catch (e, st) {
      state = AsyncValue.error(ApiErrorMapper.map(e), st);
    }
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(authRepositoryProvider);
      await repository.logout();
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(ApiErrorMapper.map(e), st);
    }
  }

  Future<void> markProfileCompleted() async {
    final currentSession = state.value;
    if (currentSession != null) {
      state = AsyncValue.data(currentSession.copyWith(profileCompleted: true));
    }
  }

  Future<void> markPregnancyConfigured() async {
    final currentSession = state.value;
    if (currentSession != null) {
      state = AsyncValue.data(
        currentSession.copyWith(pregnancyConfigured: true),
      );
    }
  }

  // Conservés pour compatibilité si appelés ailleurs,
  // bien que la logique métier utilise maintenant la session en mémoire.
  Future<bool> checkProfileCompleted() async {
    final repository = ref.read(authRepositoryProvider);
    return await repository.checkProfileCompleted();
  }

  Future<bool> checkPregnancyConfigured() async {
    final repository = ref.read(authRepositoryProvider);
    return await repository.checkPregnancyConfigured();
  }
}

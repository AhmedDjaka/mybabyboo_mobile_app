import '../../domain/entities/auth_user.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/entities/registration_draft.dart';

abstract class AuthRepository {
  Future<Map<String, dynamic>> startRegistration(String phone);
  Future<String> verifyRegistration(String verificationId, String code);
  Future<Map<String, dynamic>> resendRegistrationOtp(String verificationId);
  Future<AuthUser> completeRegistration(RegistrationDraft draft);

  Future<AuthSession> login(String phone, String password);
  Future<void> logout();
  Future<AuthSession> fetchSession();

  Future<void> forgotPassword(String phone);
  Future<void> verifyPasswordReset(String phone, String code);
  Future<void> resetPassword(String phone, String password);

  /// Vérifie depuis le backend si le profil de l'utilisatrice est complet.
  /// Source de vérité : /auth/me → profile_completed
  Future<bool> checkProfileCompleted();

  /// Vérifie depuis le backend si la grossesse de l'utilisatrice est configurée.
  /// Source de vérité : /auth/me → pregnancy_configured
  Future<bool> checkPregnancyConfigured();
}

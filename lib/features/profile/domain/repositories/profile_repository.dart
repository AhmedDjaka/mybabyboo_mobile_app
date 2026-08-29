import '../entities/user_profile.dart';

abstract interface class ProfileRepository {
  Future<UserProfile?> getProfile();
  Future<UserProfile> updateProfile({
    required String displayName,
    DateTime? birthDate,
    required String countryCode,
    String? city,
    required String locale,
    required bool voiceAssistanceEnabled,
  });
  Future<String> uploadProfilePhoto(String imagePath);
  Future<void> deleteProfilePhoto();
}

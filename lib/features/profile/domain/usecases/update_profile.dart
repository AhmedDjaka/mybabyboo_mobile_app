import '../entities/user_profile.dart';
import '../repositories/profile_repository.dart';

class UpdateProfile {
  final ProfileRepository _repository;

  const UpdateProfile(this._repository);

  Future<UserProfile> call({
    required String displayName,
    DateTime? birthDate,
    required String countryCode,
    String? city,
    required String locale,
    required bool voiceAssistanceEnabled,
  }) => _repository.updateProfile(
    displayName: displayName,
    birthDate: birthDate,
    countryCode: countryCode,
    city: city,
    locale: locale,
    voiceAssistanceEnabled: voiceAssistanceEnabled,
  );
}

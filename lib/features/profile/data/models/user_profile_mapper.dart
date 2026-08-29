import '../../domain/entities/user_profile.dart';
import 'user_profile_model.dart';

extension UserProfileMapper on UserProfileModel {
  UserProfile toEntity() {
    return UserProfile(
      id: id,
      userId: userId,
      displayName: displayName,
      birthDate: birthDate != null ? DateTime.tryParse(birthDate!) : null,
      countryCode: countryCode,
      city: city,
      locale: locale,
      voiceAssistanceEnabled: voiceAssistanceEnabled,
      profileCompleted: profileCompleted,
      profileCompletedAt: profileCompletedAt != null
          ? DateTime.tryParse(profileCompletedAt!)
          : null,
    );
  }
}

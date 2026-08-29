import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required int id,
    required int userId,
    required String displayName,
    DateTime? birthDate,
    @Default('CI') String countryCode,
    String? city,
    @Default('fr') String locale,
    @Default(false) bool voiceAssistanceEnabled,
    @Default(false) bool profileCompleted,
    DateTime? profileCompletedAt,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

/// Data model pour le JSON de l'API. Mappé vers l'entité UserProfile.
@freezed
abstract class UserProfileModel with _$UserProfileModel {
  const factory UserProfileModel({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'display_name') required String displayName,
    @JsonKey(name: 'birth_date') String? birthDate,
    @JsonKey(name: 'country_code') @Default('CI') String countryCode,
    String? city,
    @Default('fr') String locale,
    @JsonKey(name: 'voice_assistance_enabled')
    @Default(false)
    bool voiceAssistanceEnabled,
    @JsonKey(name: 'profile_completed') @Default(false) bool profileCompleted,
    @JsonKey(name: 'profile_completed_at') String? profileCompletedAt,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);
}

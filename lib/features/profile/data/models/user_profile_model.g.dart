// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    _UserProfileModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      displayName: json['display_name'] as String,
      birthDate: json['birth_date'] as String?,
      countryCode: json['country_code'] as String? ?? 'CI',
      city: json['city'] as String?,
      locale: json['locale'] as String? ?? 'fr',
      voiceAssistanceEnabled:
          json['voice_assistance_enabled'] as bool? ?? false,
      profileCompleted: json['profile_completed'] as bool? ?? false,
      profileCompletedAt: json['profile_completed_at'] as String?,
    );

Map<String, dynamic> _$UserProfileModelToJson(_UserProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'display_name': instance.displayName,
      'birth_date': instance.birthDate,
      'country_code': instance.countryCode,
      'city': instance.city,
      'locale': instance.locale,
      'voice_assistance_enabled': instance.voiceAssistanceEnabled,
      'profile_completed': instance.profileCompleted,
      'profile_completed_at': instance.profileCompletedAt,
    };

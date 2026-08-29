// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  id: (json['id'] as num).toInt(),
  userId: (json['userId'] as num).toInt(),
  displayName: json['displayName'] as String,
  birthDate: json['birthDate'] == null
      ? null
      : DateTime.parse(json['birthDate'] as String),
  countryCode: json['countryCode'] as String? ?? 'CI',
  city: json['city'] as String?,
  locale: json['locale'] as String? ?? 'fr',
  voiceAssistanceEnabled: json['voiceAssistanceEnabled'] as bool? ?? false,
  profileCompleted: json['profileCompleted'] as bool? ?? false,
  profileCompletedAt: json['profileCompletedAt'] == null
      ? null
      : DateTime.parse(json['profileCompletedAt'] as String),
);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'displayName': instance.displayName,
      'birthDate': instance.birthDate?.toIso8601String(),
      'countryCode': instance.countryCode,
      'city': instance.city,
      'locale': instance.locale,
      'voiceAssistanceEnabled': instance.voiceAssistanceEnabled,
      'profileCompleted': instance.profileCompleted,
      'profileCompletedAt': instance.profileCompletedAt?.toIso8601String(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthSession _$AuthSessionFromJson(Map<String, dynamic> json) => _AuthSession(
  user: AuthUser.fromJson(json['user'] as Map<String, dynamic>),
  profileCompleted: json['profile_completed'] as bool,
  pregnancyConfigured: json['pregnancy_configured'] as bool,
);

Map<String, dynamic> _$AuthSessionToJson(_AuthSession instance) =>
    <String, dynamic>{
      'user': instance.user,
      'profile_completed': instance.profileCompleted,
      'pregnancy_configured': instance.pregnancyConfigured,
    };

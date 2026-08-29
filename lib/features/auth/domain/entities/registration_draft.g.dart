// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_draft.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegistrationDraft _$RegistrationDraftFromJson(Map<String, dynamic> json) =>
    _RegistrationDraft(
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      verificationId: json['verificationId'] as String? ?? '',
      destinationMasked: json['destinationMasked'] as String? ?? '',
      expiresIn: (json['expiresIn'] as num?)?.toInt() ?? 0,
      password: json['password'] as String? ?? '',
      email: json['email'] as String? ?? '',
      acceptedTerms: json['acceptedTerms'] as bool? ?? false,
      verificationToken: json['verificationToken'] as String? ?? '',
    );

Map<String, dynamic> _$RegistrationDraftToJson(_RegistrationDraft instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'verificationId': instance.verificationId,
      'destinationMasked': instance.destinationMasked,
      'expiresIn': instance.expiresIn,
      'password': instance.password,
      'email': instance.email,
      'acceptedTerms': instance.acceptedTerms,
      'verificationToken': instance.verificationToken,
    };

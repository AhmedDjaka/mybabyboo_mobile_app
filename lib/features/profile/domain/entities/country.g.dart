// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Country _$CountryFromJson(Map<String, dynamic> json) => _Country(
  isoCode: json['iso_code'] as String,
  name: json['name'] as String,
  dialCode: json['dial_code'] as String?,
);

Map<String, dynamic> _$CountryToJson(_Country instance) => <String, dynamic>{
  'iso_code': instance.isoCode,
  'name': instance.name,
  'dial_code': instance.dialCode,
};

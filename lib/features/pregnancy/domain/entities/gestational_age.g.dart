// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gestational_age.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GestationalAge _$GestationalAgeFromJson(Map<String, dynamic> json) =>
    _GestationalAge(
      totalDays: (json['total_days'] as num).toInt(),
      weeks: (json['weeks'] as num).toInt(),
      days: (json['days'] as num).toInt(),
    );

Map<String, dynamic> _$GestationalAgeToJson(_GestationalAge instance) =>
    <String, dynamic>{
      'total_days': instance.totalDays,
      'weeks': instance.weeks,
      'days': instance.days,
    };

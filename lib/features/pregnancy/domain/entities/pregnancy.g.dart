// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pregnancy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Pregnancy _$PregnancyFromJson(Map<String, dynamic> json) => _Pregnancy(
  id: (json['id'] as num).toInt(),
  status: json['status'] as String,
  datingMethod: $enumDecode(
    _$PregnancyDatingMethodEnumMap,
    json['dating_method'],
  ),
  lastMenstrualPeriodDate: json['last_menstrual_period_date'] == null
      ? null
      : DateTime.parse(json['last_menstrual_period_date'] as String),
  dueDate: json['due_date'] == null
      ? null
      : DateTime.parse(json['due_date'] as String),
  isDueDateEstimated: json['is_due_date_estimated'] as bool?,
  pregnancyDated: json['pregnancy_dated'] as bool,
  gestationalAge: json['gestational_age'] == null
      ? null
      : GestationalAge.fromJson(
          json['gestational_age'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$PregnancyToJson(_Pregnancy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'dating_method': _$PregnancyDatingMethodEnumMap[instance.datingMethod]!,
      'last_menstrual_period_date': instance.lastMenstrualPeriodDate
          ?.toIso8601String(),
      'due_date': instance.dueDate?.toIso8601String(),
      'is_due_date_estimated': instance.isDueDateEstimated,
      'pregnancy_dated': instance.pregnancyDated,
      'gestational_age': instance.gestationalAge,
    };

const _$PregnancyDatingMethodEnumMap = {
  PregnancyDatingMethod.professionalDueDate: 'professional_due_date',
  PregnancyDatingMethod.lastMenstrualPeriod: 'last_menstrual_period',
  PregnancyDatingMethod.unknown: 'unknown',
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_pregnancy_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeeklyPregnancyContentModel _$WeeklyPregnancyContentModelFromJson(
  Map<String, dynamic> json,
) => _WeeklyPregnancyContentModel(
  week: (json['week'] as num).toInt(),
  sizeCm: (json['size_cm'] as num?)?.toDouble(),
  weightG: (json['weight_g'] as num?)?.toInt(),
  fruitComparison: json['fruit_comparison'] as String?,
  description: json['description'] as String?,
  developmentHighlights: (json['development_highlights'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  momChanges: json['mom_changes'] as String?,
);

Map<String, dynamic> _$WeeklyPregnancyContentModelToJson(
  _WeeklyPregnancyContentModel instance,
) => <String, dynamic>{
  'week': instance.week,
  'size_cm': instance.sizeCm,
  'weight_g': instance.weightG,
  'fruit_comparison': instance.fruitComparison,
  'description': instance.description,
  'development_highlights': instance.developmentHighlights,
  'mom_changes': instance.momChanges,
};

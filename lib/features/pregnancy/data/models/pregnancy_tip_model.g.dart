// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pregnancy_tip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PregnancyTipModel _$PregnancyTipModelFromJson(Map<String, dynamic> json) =>
    _PregnancyTipModel(
      id: (json['id'] as num).toInt(),
      week: (json['week'] as num?)?.toInt(),
      category: json['category'] as String,
      title: json['title'] as String,
      summary: json['summary'] as String,
      content: json['content'] as String,
      isFeatured: json['is_featured'] as bool,
    );

Map<String, dynamic> _$PregnancyTipModelToJson(_PregnancyTipModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'week': instance.week,
      'category': instance.category,
      'title': instance.title,
      'summary': instance.summary,
      'content': instance.content,
      'is_featured': instance.isFeatured,
    };

import 'package:freezed_annotation/freezed_annotation.dart';

part 'weekly_pregnancy_content_model.freezed.dart';
part 'weekly_pregnancy_content_model.g.dart';

@freezed
abstract class WeeklyPregnancyContentModel with _$WeeklyPregnancyContentModel {
  const factory WeeklyPregnancyContentModel({
    required int week,
    @JsonKey(name: 'size_cm') double? sizeCm,
    @JsonKey(name: 'weight_g') int? weightG,
    @JsonKey(name: 'fruit_comparison') String? fruitComparison,
    required String? description,
    @JsonKey(name: 'development_highlights')
    List<String>? developmentHighlights,
    @JsonKey(name: 'mom_changes') String? momChanges,
  }) = _WeeklyPregnancyContentModel;

  factory WeeklyPregnancyContentModel.fromJson(Map<String, dynamic> json) =>
      _$WeeklyPregnancyContentModelFromJson(json);
}

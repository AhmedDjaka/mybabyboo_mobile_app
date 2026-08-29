import 'package:freezed_annotation/freezed_annotation.dart';

part 'weekly_pregnancy_content.freezed.dart';

@freezed
abstract class WeeklyPregnancyContent with _$WeeklyPregnancyContent {
  const factory WeeklyPregnancyContent({
    required int week,
    double? sizeCm,
    int? weightG,
    String? fruitComparison,
    String? description,
    @Default([]) List<String> developmentHighlights,
    String? momChanges,
  }) = _WeeklyPregnancyContent;
}

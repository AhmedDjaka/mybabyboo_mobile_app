import 'package:freezed_annotation/freezed_annotation.dart';

import 'gestational_age.dart';
import 'pregnancy_dating_method.dart';

part 'pregnancy.freezed.dart';
part 'pregnancy.g.dart';

@freezed
abstract class Pregnancy with _$Pregnancy {
  const factory Pregnancy({
    required int id,
    required String status,
    @JsonKey(name: 'dating_method') required PregnancyDatingMethod datingMethod,
    @JsonKey(name: 'last_menstrual_period_date')
    DateTime? lastMenstrualPeriodDate,
    @JsonKey(name: 'due_date') DateTime? dueDate,
    @JsonKey(name: 'is_due_date_estimated') bool? isDueDateEstimated,
    @JsonKey(name: 'pregnancy_dated') required bool pregnancyDated,
    @JsonKey(name: 'gestational_age') GestationalAge? gestationalAge,
  }) = _Pregnancy;

  factory Pregnancy.fromJson(Map<String, dynamic> json) =>
      _$PregnancyFromJson(json);
}

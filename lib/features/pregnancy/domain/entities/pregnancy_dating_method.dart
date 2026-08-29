import 'package:freezed_annotation/freezed_annotation.dart';

enum PregnancyDatingMethod {
  @JsonValue('professional_due_date')
  professionalDueDate,

  @JsonValue('last_menstrual_period')
  lastMenstrualPeriod,

  @JsonValue('unknown')
  unknown,
}

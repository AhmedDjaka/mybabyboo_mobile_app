import 'package:freezed_annotation/freezed_annotation.dart';

part 'gestational_age.freezed.dart';
part 'gestational_age.g.dart';

@freezed
abstract class GestationalAge with _$GestationalAge {
  const factory GestationalAge({
    @JsonKey(name: 'total_days') required int totalDays,
    required int weeks,
    required int days,
  }) = _GestationalAge;

  factory GestationalAge.fromJson(Map<String, dynamic> json) =>
      _$GestationalAgeFromJson(json);
}

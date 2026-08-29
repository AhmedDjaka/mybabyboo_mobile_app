import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_summary.freezed.dart';
part 'home_summary.g.dart';

@freezed
abstract class HomeSummary with _$HomeSummary {
  const factory HomeSummary({
    required HomeUser user,
    HomePregnancy? pregnancy,
    @JsonKey(name: 'baby_this_week') HomeBabyThisWeek? babyThisWeek,
    @JsonKey(name: 'daily_message') String? dailyMessage,
    @JsonKey(name: 'next_appointment') HomeNextAppointment? nextAppointment,
  }) = _HomeSummary;

  factory HomeSummary.fromJson(Map<String, dynamic> json) =>
      _$HomeSummaryFromJson(json);
}

@freezed
abstract class HomeUser with _$HomeUser {
  const factory HomeUser({
    @JsonKey(name: 'display_name') required String displayName,
    @JsonKey(name: 'profile_photo_url') String? profilePhotoUrl,
  }) = _HomeUser;

  factory HomeUser.fromJson(Map<String, dynamic> json) =>
      _$HomeUserFromJson(json);
}

@freezed
abstract class HomePregnancy with _$HomePregnancy {
  const factory HomePregnancy({
    @JsonKey(name: 'pregnancy_dated') required bool pregnancyDated,
    @JsonKey(name: 'dating_method') required String datingMethod,
    @JsonKey(name: 'due_date') String? dueDate,
    @JsonKey(name: 'gestational_age') HomeGestationalAge? gestationalAge,
    int? trimester,
    @JsonKey(name: 'progress_percentage') int? progressPercentage,
  }) = _HomePregnancy;

  factory HomePregnancy.fromJson(Map<String, dynamic> json) =>
      _$HomePregnancyFromJson(json);
}

@freezed
abstract class HomeGestationalAge with _$HomeGestationalAge {
  const factory HomeGestationalAge({
    @JsonKey(name: 'total_days') required int totalDays,
    required int weeks,
    required int days,
  }) = _HomeGestationalAge;

  factory HomeGestationalAge.fromJson(Map<String, dynamic> json) =>
      _$HomeGestationalAgeFromJson(json);
}

@freezed
abstract class HomeBabyThisWeek with _$HomeBabyThisWeek {
  const factory HomeBabyThisWeek({
    required int week,
    required String title,
    required String summary,
    @JsonKey(name: 'size_cm') double? sizeCm,
    @JsonKey(name: 'weight_g') int? weightG,
    @JsonKey(name: 'fruit_comparison') String? fruitComparison,
  }) = _HomeBabyThisWeek;

  factory HomeBabyThisWeek.fromJson(Map<String, dynamic> json) =>
      _$HomeBabyThisWeekFromJson(json);
}

@freezed
abstract class HomeNextAppointment with _$HomeNextAppointment {
  const factory HomeNextAppointment({
    required int id,
    required String title,
    @JsonKey(name: 'appointment_date') required DateTime appointmentDate,
  }) = _HomeNextAppointment;

  factory HomeNextAppointment.fromJson(Map<String, dynamic> json) =>
      _$HomeNextAppointmentFromJson(json);
}

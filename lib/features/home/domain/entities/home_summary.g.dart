// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeSummary _$HomeSummaryFromJson(Map<String, dynamic> json) => _HomeSummary(
  user: HomeUser.fromJson(json['user'] as Map<String, dynamic>),
  pregnancy: json['pregnancy'] == null
      ? null
      : HomePregnancy.fromJson(json['pregnancy'] as Map<String, dynamic>),
  babyThisWeek: json['baby_this_week'] == null
      ? null
      : HomeBabyThisWeek.fromJson(
          json['baby_this_week'] as Map<String, dynamic>,
        ),
  dailyMessage: json['daily_message'] as String?,
  nextAppointment: json['next_appointment'] == null
      ? null
      : HomeNextAppointment.fromJson(
          json['next_appointment'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$HomeSummaryToJson(_HomeSummary instance) =>
    <String, dynamic>{
      'user': instance.user,
      'pregnancy': instance.pregnancy,
      'baby_this_week': instance.babyThisWeek,
      'daily_message': instance.dailyMessage,
      'next_appointment': instance.nextAppointment,
    };

_HomeUser _$HomeUserFromJson(Map<String, dynamic> json) => _HomeUser(
  displayName: json['display_name'] as String,
  profilePhotoUrl: json['profile_photo_url'] as String?,
);

Map<String, dynamic> _$HomeUserToJson(_HomeUser instance) => <String, dynamic>{
  'display_name': instance.displayName,
  'profile_photo_url': instance.profilePhotoUrl,
};

_HomePregnancy _$HomePregnancyFromJson(Map<String, dynamic> json) =>
    _HomePregnancy(
      pregnancyDated: json['pregnancy_dated'] as bool,
      datingMethod: json['dating_method'] as String,
      dueDate: json['due_date'] as String?,
      gestationalAge: json['gestational_age'] == null
          ? null
          : HomeGestationalAge.fromJson(
              json['gestational_age'] as Map<String, dynamic>,
            ),
      trimester: (json['trimester'] as num?)?.toInt(),
      progressPercentage: (json['progress_percentage'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HomePregnancyToJson(_HomePregnancy instance) =>
    <String, dynamic>{
      'pregnancy_dated': instance.pregnancyDated,
      'dating_method': instance.datingMethod,
      'due_date': instance.dueDate,
      'gestational_age': instance.gestationalAge,
      'trimester': instance.trimester,
      'progress_percentage': instance.progressPercentage,
    };

_HomeGestationalAge _$HomeGestationalAgeFromJson(Map<String, dynamic> json) =>
    _HomeGestationalAge(
      totalDays: (json['total_days'] as num).toInt(),
      weeks: (json['weeks'] as num).toInt(),
      days: (json['days'] as num).toInt(),
    );

Map<String, dynamic> _$HomeGestationalAgeToJson(_HomeGestationalAge instance) =>
    <String, dynamic>{
      'total_days': instance.totalDays,
      'weeks': instance.weeks,
      'days': instance.days,
    };

_HomeBabyThisWeek _$HomeBabyThisWeekFromJson(Map<String, dynamic> json) =>
    _HomeBabyThisWeek(
      week: (json['week'] as num).toInt(),
      title: json['title'] as String,
      summary: json['summary'] as String,
      sizeCm: (json['size_cm'] as num?)?.toDouble(),
      weightG: (json['weight_g'] as num?)?.toInt(),
      fruitComparison: json['fruit_comparison'] as String?,
    );

Map<String, dynamic> _$HomeBabyThisWeekToJson(_HomeBabyThisWeek instance) =>
    <String, dynamic>{
      'week': instance.week,
      'title': instance.title,
      'summary': instance.summary,
      'size_cm': instance.sizeCm,
      'weight_g': instance.weightG,
      'fruit_comparison': instance.fruitComparison,
    };

_HomeNextAppointment _$HomeNextAppointmentFromJson(Map<String, dynamic> json) =>
    _HomeNextAppointment(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      appointmentDate: DateTime.parse(json['appointment_date'] as String),
    );

Map<String, dynamic> _$HomeNextAppointmentToJson(
  _HomeNextAppointment instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'appointment_date': instance.appointmentDate.toIso8601String(),
};

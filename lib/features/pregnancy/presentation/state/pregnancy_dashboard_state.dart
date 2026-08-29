import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/pregnancy.dart';
import '../../domain/entities/weekly_pregnancy_content.dart';

part 'pregnancy_dashboard_state.freezed.dart';

@freezed
abstract class PregnancyDashboardState with _$PregnancyDashboardState {
  const factory PregnancyDashboardState({
    @Default(false) bool isLoading,
    @Default(false) bool isWeekLoading,
    Pregnancy? currentPregnancy,
    int? currentWeek,
    int? selectedWeek,
    WeeklyPregnancyContent? weeklyContent,
    String? errorMessage,
    String? weeklyError,
  }) = _PregnancyDashboardState;
}

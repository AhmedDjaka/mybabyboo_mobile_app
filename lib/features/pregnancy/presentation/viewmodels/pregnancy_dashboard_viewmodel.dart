import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/get_current_pregnancy.dart';
import '../../domain/usecases/get_weekly_pregnancy_content.dart';
import '../state/pregnancy_dashboard_state.dart';

class PregnancyDashboardViewModel
    extends StateNotifier<PregnancyDashboardState> {
  final GetCurrentPregnancy _getCurrentPregnancy;
  final GetWeeklyPregnancyContent _getWeeklyPregnancyContent;

  PregnancyDashboardViewModel(
    this._getCurrentPregnancy,
    this._getWeeklyPregnancyContent,
  ) : super(const PregnancyDashboardState()) {
    _init();
  }

  Future<void> _init() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final pregnancy = await _getCurrentPregnancy.execute();

      if (pregnancy == null) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: 'Aucune grossesse active trouvée.',
        );
        return;
      }

      final gestationalAge = pregnancy.gestationalAge;
      final currentWeek = gestationalAge?.weeks;

      int? initialSelectedWeek;
      if (pregnancy.pregnancyDated && currentWeek != null) {
        if (currentWeek < 4) {
          initialSelectedWeek = null;
        } else if (currentWeek <= 40) {
          initialSelectedWeek = currentWeek;
        } else {
          initialSelectedWeek = 40;
        }
      }

      state = state.copyWith(
        isLoading: false,
        currentPregnancy: pregnancy,
        currentWeek: currentWeek,
        selectedWeek: initialSelectedWeek,
      );

      if (initialSelectedWeek != null) {
        await _fetchWeeklyContent(initialSelectedWeek);
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Impossible de charger les données de la grossesse.',
      );
    }
  }

  Future<void> _fetchWeeklyContent(int week) async {
    state = state.copyWith(isWeekLoading: true, weeklyError: null);
    try {
      final content = await _getWeeklyPregnancyContent.execute(week);
      state = state.copyWith(isWeekLoading: false, weeklyContent: content);
    } catch (e) {
      state = state.copyWith(
        isWeekLoading: false,
        weeklyError: 'Impossible de charger le contenu de cette semaine.',
      );
    }
  }

  Future<void> goToPreviousWeek() async {
    if (state.selectedWeek == null || state.selectedWeek! <= 4) return;
    if (state.isWeekLoading) return; // Protection contre le double load

    final oldWeek = state.selectedWeek!;
    final newWeek = oldWeek - 1;
    state = state.copyWith(selectedWeek: newWeek);
    await _fetchWeeklyContent(newWeek);
  }

  Future<void> goToNextWeek() async {
    if (state.selectedWeek == null || state.currentWeek == null) return;
    if (state.isWeekLoading) return; // Protection contre le double load

    final maxAllowedWeek = state.currentWeek! > 40 ? 40 : state.currentWeek!;
    if (state.selectedWeek! >= maxAllowedWeek) return;

    final oldWeek = state.selectedWeek!;
    final newWeek = oldWeek + 1;
    state = state.copyWith(selectedWeek: newWeek);
    await _fetchWeeklyContent(newWeek);
  }

  Future<void> refresh() async {
    await _init();
  }
}

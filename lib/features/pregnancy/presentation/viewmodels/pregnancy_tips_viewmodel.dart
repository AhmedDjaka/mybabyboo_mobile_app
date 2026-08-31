import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/get_pregnancy_tips.dart';
import '../../domain/entities/pregnancy_tip.dart';
import '../state/pregnancy_tips_state.dart';

class PregnancyTipsViewModel extends StateNotifier<PregnancyTipsState> {
  final GetPregnancyTips _getPregnancyTips;

  PregnancyTipsViewModel(this._getPregnancyTips)
    : super(const PregnancyTipsState());

  Future<void> loadTips({int? week}) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
      currentWeekContext: week ?? state.currentWeekContext,
    );

    try {
      // Always fetch all tips for the week context to enable local filtering
      final allTips = await _getPregnancyTips(
        week: state.currentWeekContext,
        category: null,
      );

      final filteredTips = state.selectedCategory != null
          ? allTips.where((t) => t.category == state.selectedCategory).toList()
          : allTips;

      state = state.copyWith(
        isLoading: false, 
        allTips: allTips,
        tips: filteredTips,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: "Impossible de charger les conseils pour le moment.",
      );
    }
  }

  void selectCategory(PregnancyTipCategory? category) {
    if (state.selectedCategory == category) return;

    final filteredTips = category != null
        ? state.allTips.where((t) => t.category == category).toList()
        : state.allTips;

    state = state.copyWith(
      selectedCategory: category,
      tips: filteredTips,
    );
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/get_pregnancy_tips.dart';
import '../../domain/entities/pregnancy_tip.dart';
import '../../data/mappers/pregnancy_tip_mapper.dart';
import '../state/pregnancy_tips_state.dart';

class PregnancyTipsViewModel extends StateNotifier<PregnancyTipsState> {
  final GetPregnancyTips _getPregnancyTips;

  PregnancyTipsViewModel(this._getPregnancyTips)
      : super(const PregnancyTipsState());

  Future<void> loadTips({int? week}) async {
    state = state.copyWith(isLoading: true, error: null, currentWeekContext: week ?? state.currentWeekContext);

    try {
      final String? categoryStr = state.selectedCategory != null
          ? PregnancyTipMapper.mapCategoryToString(state.selectedCategory!)
          : null;

      final tips = await _getPregnancyTips(
        week: state.currentWeekContext,
        category: categoryStr,
      );

      state = state.copyWith(
        isLoading: false,
        tips: tips,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: "Impossible de charger les conseils pour le moment.",
      );
    }
  }

  Future<void> selectCategory(PregnancyTipCategory? category) async {
    if (state.selectedCategory == category) return;
    
    state = state.copyWith(selectedCategory: category);
    await loadTips();
  }
}

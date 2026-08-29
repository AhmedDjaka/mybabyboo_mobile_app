import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/pregnancy_tip.dart';

part 'pregnancy_tips_state.freezed.dart';

@freezed
abstract class PregnancyTipsState with _$PregnancyTipsState {
  const factory PregnancyTipsState({
    @Default(true) bool isLoading,
    @Default(null) String? error,
    @Default([]) List<PregnancyTip> tips,
    PregnancyTipCategory? selectedCategory,
    int? currentWeekContext,
  }) = _PregnancyTipsState;
}

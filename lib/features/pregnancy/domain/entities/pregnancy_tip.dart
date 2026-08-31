import 'package:freezed_annotation/freezed_annotation.dart';
import 'pregnancy_tip_illustration.dart';

part 'pregnancy_tip.freezed.dart';

enum PregnancyTipCategory {
  wellbeing,
  nutrition,
  sleep,
  activity,
  organization,
  unknown,
}

@freezed
abstract class PregnancyTip with _$PregnancyTip {
  const factory PregnancyTip({
    required int id,
    int? week,
    required PregnancyTipCategory category,
    required String title,
    required String summary,
    required String content,
    required bool isFeatured,
    PregnancyTipIllustration? illustration,
  }) = _PregnancyTip;
}

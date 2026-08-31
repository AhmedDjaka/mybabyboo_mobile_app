import 'package:freezed_annotation/freezed_annotation.dart';
import 'pregnancy_tip_illustration_model.dart';

part 'pregnancy_tip_model.freezed.dart';
part 'pregnancy_tip_model.g.dart';

@freezed
abstract class PregnancyTipModel with _$PregnancyTipModel {
  const factory PregnancyTipModel({
    required int id,
    int? week,
    required String category,
    required String title,
    required String summary,
    required String content,
    @JsonKey(name: 'is_featured') required bool isFeatured,
    PregnancyTipIllustrationModel? illustration,
  }) = _PregnancyTipModel;

  factory PregnancyTipModel.fromJson(Map<String, dynamic> json) =>
      _$PregnancyTipModelFromJson(json);
}

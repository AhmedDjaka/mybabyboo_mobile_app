import 'package:freezed_annotation/freezed_annotation.dart';

part 'pregnancy_tip_illustration_model.freezed.dart';
part 'pregnancy_tip_illustration_model.g.dart';

@freezed
abstract class PregnancyTipIllustrationModel
    with _$PregnancyTipIllustrationModel {
  const factory PregnancyTipIllustrationModel({
    required String key,
    @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'alt_text') String? altText,
  }) = _PregnancyTipIllustrationModel;

  factory PregnancyTipIllustrationModel.fromJson(Map<String, dynamic> json) =>
      _$PregnancyTipIllustrationModelFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pregnancy_tip_illustration.freezed.dart';

@freezed
abstract class PregnancyTipIllustration with _$PregnancyTipIllustration {
  const factory PregnancyTipIllustration({
    required String key,
    String? thumbnailUrl,
    String? imageUrl,
    String? altText,
  }) = _PregnancyTipIllustration;
}

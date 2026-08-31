import 'package:baby_mama/features/pregnancy/data/models/pregnancy_tip_model.dart';
import 'package:baby_mama/features/pregnancy/domain/entities/pregnancy_tip.dart';
import 'package:baby_mama/features/pregnancy/domain/entities/pregnancy_tip_illustration.dart';

class PregnancyTipMapper {
  static PregnancyTip fromModel(PregnancyTipModel model) {
    return PregnancyTip(
      id: model.id,
      week: model.week,
      category: _mapCategory(model.category),
      title: model.title,
      summary: model.summary,
      content: model.content,
      isFeatured: model.isFeatured,
      illustration: model.illustration != null
          ? PregnancyTipIllustration(
              key: model.illustration!.key,
              thumbnailUrl: model.illustration!.thumbnailUrl,
              imageUrl: model.illustration!.imageUrl,
              altText: model.illustration!.altText,
            )
          : null,
    );
  }

  static PregnancyTipCategory _mapCategory(String category) {
    switch (category) {
      case 'wellbeing':
        return PregnancyTipCategory.wellbeing;
      case 'nutrition':
        return PregnancyTipCategory.nutrition;
      case 'sleep':
        return PregnancyTipCategory.sleep;
      case 'activity':
        return PregnancyTipCategory.activity;
      case 'organization':
        return PregnancyTipCategory.organization;
      default:
        return PregnancyTipCategory.unknown;
    }
  }

  static String mapCategoryToString(PregnancyTipCategory category) {
    switch (category) {
      case PregnancyTipCategory.wellbeing:
        return 'wellbeing';
      case PregnancyTipCategory.nutrition:
        return 'nutrition';
      case PregnancyTipCategory.sleep:
        return 'sleep';
      case PregnancyTipCategory.activity:
        return 'activity';
      case PregnancyTipCategory.organization:
        return 'organization';
      case PregnancyTipCategory.unknown:
        return '';
    }
  }
}

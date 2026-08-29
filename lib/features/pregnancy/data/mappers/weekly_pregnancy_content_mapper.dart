import '../../domain/entities/weekly_pregnancy_content.dart';
import '../models/weekly_pregnancy_content_model.dart';

class WeeklyPregnancyContentMapper {
  static WeeklyPregnancyContent fromModel(WeeklyPregnancyContentModel model) {
    return WeeklyPregnancyContent(
      week: model.week,
      sizeCm: model.sizeCm,
      weightG: model.weightG,
      fruitComparison: model.fruitComparison,
      description: model.description,
      developmentHighlights: model.developmentHighlights ?? [],
      momChanges: model.momChanges,
    );
  }
}

import '../entities/weekly_pregnancy_content.dart';
import '../repositories/pregnancy_repository.dart';

class GetWeeklyPregnancyContent {
  final PregnancyRepository _repository;

  GetWeeklyPregnancyContent(this._repository);

  Future<WeeklyPregnancyContent?> execute(int week) {
    return _repository.getWeeklyContent(week);
  }
}

import '../entities/pregnancy.dart';
import '../entities/pregnancy_dating_method.dart';
import '../entities/weekly_pregnancy_content.dart';
import '../entities/pregnancy_tip.dart';

abstract class PregnancyRepository {
  Future<Pregnancy?> getCurrentPregnancy();

  Future<void> setupPregnancy({
    required PregnancyDatingMethod datingMethod,
    DateTime? lmpDate,
    DateTime? dueDate,
  });

  Future<Pregnancy> updateCurrentPregnancy({
    required PregnancyDatingMethod datingMethod,
    DateTime? lmpDate,
    DateTime? dueDate,
  });

  Future<WeeklyPregnancyContent?> getWeeklyContent(int week);

  Future<List<PregnancyTip>> getPregnancyTips({
    int? week,
    String? category,
  });
}

import '../entities/pregnancy_tip.dart';
import '../repositories/pregnancy_repository.dart';

class GetPregnancyTips {
  final PregnancyRepository repository;

  GetPregnancyTips(this.repository);

  Future<List<PregnancyTip>> call({
    int? week,
    String? category,
  }) async {
    return repository.getPregnancyTips(
      week: week,
      category: category,
    );
  }
}

import '../entities/pregnancy.dart';
import '../repositories/pregnancy_repository.dart';

class GetCurrentPregnancy {
  final PregnancyRepository _repository;

  GetCurrentPregnancy(this._repository);

  Future<Pregnancy?> execute() {
    return _repository.getCurrentPregnancy();
  }
}

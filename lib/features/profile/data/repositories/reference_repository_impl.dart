import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/country.dart';
import '../../domain/repositories/reference_repository.dart';
import '../datasources/reference_remote_datasource.dart';

part 'reference_repository_impl.g.dart';

class ReferenceRepositoryImpl implements ReferenceRepository {
  final ReferenceRemoteDatasource _remoteDatasource;

  ReferenceRepositoryImpl(this._remoteDatasource);

  @override
  Future<List<Country>> getCountries() {
    return _remoteDatasource.getCountries();
  }

  @override
  Future<List<String>> searchCities(String countryIso, String query) {
    return _remoteDatasource.searchCities(countryIso, query);
  }
}

@riverpod
ReferenceRepository referenceRepository(ReferenceRepositoryRef ref) {
  return ReferenceRepositoryImpl(ref.watch(referenceRemoteDatasourceProvider));
}

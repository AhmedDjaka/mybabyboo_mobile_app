import '../../domain/entities/country.dart';

abstract class ReferenceRepository {
  Future<List<Country>> getCountries();
  Future<List<String>> searchCities(String countryIso, String query);
}

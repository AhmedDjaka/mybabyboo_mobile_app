import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/country.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/errors/api_error_mapper.dart';
import '../../../../core/network/dio_client.dart';

part 'reference_remote_datasource.g.dart';

class ReferenceRemoteDatasource {
  final Dio _dio;

  ReferenceRemoteDatasource(this._dio);

  Future<List<Country>> getCountries() async {
    try {
      final response = await _dio.get(ApiEndpoints.referenceCountries);
      final List<dynamic> data = response.data;
      return data.map((json) => Country.fromJson(json)).toList();
    } on DioException catch (e) {
      throw ApiErrorMapper.map(e);
    } catch (e) {
      throw ApiErrorMapper.map(e);
    }
  }

  Future<List<String>> searchCities(String countryIso, String query) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.referenceCities,
        queryParameters: {
          'country': countryIso,
          if (query.isNotEmpty) 'q': query,
        },
      );
      final List<dynamic> data = response.data;
      return data.cast<String>();
    } on DioException catch (e) {
      throw ApiErrorMapper.map(e);
    } catch (e) {
      throw ApiErrorMapper.map(e);
    }
  }
}

@riverpod
ReferenceRemoteDatasource referenceRemoteDatasource(
  ReferenceRemoteDatasourceRef ref,
) {
  return ReferenceRemoteDatasource(ref.watch(dioClientProvider));
}

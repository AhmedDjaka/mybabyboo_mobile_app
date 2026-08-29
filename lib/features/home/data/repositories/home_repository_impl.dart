import 'package:dio/dio.dart';
import '../../domain/entities/home_summary.dart';
import '../../domain/repositories/home_repository.dart';
import '../../../../core/errors/api_error_mapper.dart';

class HomeRepositoryImpl implements HomeRepository {
  final Dio _dio;

  HomeRepositoryImpl(this._dio);

  @override
  Future<HomeSummary> getHomeSummary() async {
    try {
      final response = await _dio.get('/api/v1/home');
      return HomeSummary.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiErrorMapper.map(e);
    } catch (e) {
      throw Exception('Impossible de charger votre espace.');
    }
  }
}

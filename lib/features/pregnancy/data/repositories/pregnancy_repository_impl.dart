import '../../domain/entities/pregnancy.dart';
import '../../domain/entities/pregnancy_dating_method.dart';
import '../../domain/repositories/pregnancy_repository.dart';
import '../datasources/pregnancy_remote_datasource.dart';
import '../../../../core/errors/api_error_mapper.dart';
import 'package:dio/dio.dart';
import '../../data/mappers/weekly_pregnancy_content_mapper.dart';
import '../../domain/entities/weekly_pregnancy_content.dart';
import '../../domain/entities/pregnancy_tip.dart';
import '../mappers/pregnancy_tip_mapper.dart';

class PregnancyRepositoryImpl implements PregnancyRepository {
  final PregnancyRemoteDatasource _remoteDatasource;

  PregnancyRepositoryImpl(this._remoteDatasource);

  @override
  Future<Pregnancy?> getCurrentPregnancy() async {
    try {
      return await _remoteDatasource.getCurrentPregnancy();
    } on DioException catch (e) {
      throw ApiErrorMapper.map(e);
    } catch (e) {
      throw ApiErrorMapper.map(e);
    }
  }

  @override
  Future<Pregnancy> setupPregnancy({
    required PregnancyDatingMethod datingMethod,
    DateTime? lmpDate,
    DateTime? dueDate,
  }) async {
    try {
      return await _remoteDatasource.setupPregnancy(
        datingMethod: datingMethod,
        lmpDate: lmpDate,
        dueDate: dueDate,
      );
    } on DioException catch (e) {
      throw ApiErrorMapper.map(e);
    } catch (e) {
      throw ApiErrorMapper.map(e);
    }
  }

  @override
  Future<Pregnancy> updateCurrentPregnancy({
    required PregnancyDatingMethod datingMethod,
    DateTime? lmpDate,
    DateTime? dueDate,
  }) async {
    try {
      return await _remoteDatasource.updateCurrentPregnancy(
        datingMethod: datingMethod,
        lmpDate: lmpDate,
        dueDate: dueDate,
      );
    } on DioException catch (e) {
      throw ApiErrorMapper.map(e);
    } catch (e) {
      throw ApiErrorMapper.map(e);
    }
  }

  @override
  Future<WeeklyPregnancyContent?> getWeeklyContent(int week) async {
    try {
      final model = await _remoteDatasource.getWeeklyContent(week);
      if (model == null) return null;
      return WeeklyPregnancyContentMapper.fromModel(model);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return null;
      throw ApiErrorMapper.map(e);
    } catch (e) {
      throw ApiErrorMapper.map(e);
    }
  }

  @override
  Future<List<PregnancyTip>> getPregnancyTips({
    int? week,
    String? category,
  }) async {
    try {
      final models = await _remoteDatasource.getPregnancyTips(
        week: week,
        category: category,
      );
      return models
          .map((model) => PregnancyTipMapper.fromModel(model))
          .toList();
    } on DioException catch (e) {
      throw ApiErrorMapper.map(e);
    } catch (e) {
      throw ApiErrorMapper.map(e);
    }
  }
}

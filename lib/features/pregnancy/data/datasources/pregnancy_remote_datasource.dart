import 'package:dio/dio.dart';
import '../../domain/entities/pregnancy.dart';
import '../../domain/entities/pregnancy_dating_method.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/weekly_pregnancy_content_model.dart';
import '../models/pregnancy_tip_model.dart';

class PregnancyRemoteDatasource {
  final Dio _dio;

  PregnancyRemoteDatasource(this._dio);

  Future<Pregnancy?> getCurrentPregnancy() async {
    final response = await _dio.get(ApiEndpoints.pregnancyCurrent);
    if (response.data == null) return null;
    return Pregnancy.fromJson(response.data);
  }

  Future<Pregnancy> setupPregnancy({
    required PregnancyDatingMethod datingMethod,
    DateTime? lmpDate,
    DateTime? dueDate,
  }) async {
    final payload = {'dating_method': _enumToString(datingMethod)};

    if (lmpDate != null) {
      payload['last_menstrual_period_date'] = _formatDate(lmpDate);
    }
    if (dueDate != null) {
      payload['due_date'] = _formatDate(dueDate);
    }

    final response = await _dio.post(
      ApiEndpoints.pregnancySetup,
      data: payload,
    );
    return Pregnancy.fromJson(response.data);
  }

  Future<Pregnancy> updateCurrentPregnancy({
    required PregnancyDatingMethod datingMethod,
    DateTime? lmpDate,
    DateTime? dueDate,
  }) async {
    final payload = {'dating_method': _enumToString(datingMethod)};

    if (lmpDate != null) {
      payload['last_menstrual_period_date'] = _formatDate(lmpDate);
    }
    if (dueDate != null) {
      payload['due_date'] = _formatDate(dueDate);
    }

    final response = await _dio.put(
      ApiEndpoints.pregnancyCurrent,
      data: payload,
    );
    return Pregnancy.fromJson(response.data);
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  String _enumToString(PregnancyDatingMethod method) {
    switch (method) {
      case PregnancyDatingMethod.professionalDueDate:
        return 'professional_due_date';
      case PregnancyDatingMethod.lastMenstrualPeriod:
        return 'last_menstrual_period';
      case PregnancyDatingMethod.unknown:
        return 'unknown';
    }
  }

  Future<WeeklyPregnancyContentModel?> getWeeklyContent(int week) async {
    final response = await _dio.get('${ApiEndpoints.pregnancyWeeks}/$week');
    if (response.data == null || response.data['data'] == null) return null;
    return WeeklyPregnancyContentModel.fromJson(response.data['data']);
  }

  Future<List<PregnancyTipModel>> getPregnancyTips({
    int? week,
    String? category,
  }) async {
    final Map<String, dynamic> queryParameters = {};
    if (week != null) {
      queryParameters['week'] = week;
    }
    if (category != null && category.isNotEmpty) {
      queryParameters['category'] = category;
    }

    final response = await _dio.get(
      ApiEndpoints.pregnancyTips,
      queryParameters: queryParameters,
    );

    final List<dynamic> data = response.data['data'] ?? [];
    return data.map((json) => PregnancyTipModel.fromJson(json)).toList();
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:baby_mama/core/errors/api_exception.dart';
import 'package:baby_mama/core/errors/api_error_mapper.dart';

void main() {
  group('ApiErrorMapper', () {
    test('maps connectionError to user-friendly message', () {
      final dioError = DioException(
        requestOptions: RequestOptions(path: ''),
        type: DioExceptionType.connectionError,
      );

      final exception = ApiErrorMapper.map(dioError);

      expect(exception, isA<ApiException>());
      expect(exception.message, contains('Impossible de contacter le serveur'));
    });

    test('does not leak DioException brut', () {
      final dioError = DioException(
        requestOptions: RequestOptions(path: ''),
        type: DioExceptionType.connectionTimeout,
      );

      final exception = ApiErrorMapper.map(dioError);

      expect(exception.message, isNot(contains('DioException')));
    });
  });
}

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../storage/secure_storage_service.dart';

class AuthInterceptor extends Interceptor {
  final Ref ref;

  AuthInterceptor(this.ref);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final storageService = ref.read(secureStorageServiceProvider);
    final token = await storageService.getToken();

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    // Default Accept header
    options.headers['Accept'] = 'application/json';

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Token is invalid or expired
      final storageService = ref.read(secureStorageServiceProvider);
      await storageService.deleteToken();
      // Handle logout/redirect logic via state change later
    }
    return handler.next(err);
  }
}

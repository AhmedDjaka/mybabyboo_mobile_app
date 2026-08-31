import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../storage/secure_storage_service.dart';
import '../../features/auth/presentation/viewmodels/auth_viewmodel.dart';

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

    print('[AUTH_DEBUG] endpoint=${options.path}');
    print('[AUTH_DEBUG] token_present=${token != null}');
    print('[AUTH_DEBUG] authorization_header_present=${options.headers.containsKey('Authorization')}');

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('[AUTH_DEBUG] endpoint=${response.requestOptions.path}');
    print('[AUTH_DEBUG] status=${response.statusCode}');
    print('[AUTH_DEBUG] response=${response.data}');
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    print('[AUTH_DEBUG] endpoint=${err.requestOptions.path}');
    print('[AUTH_DEBUG] status=${err.response?.statusCode}');
    print('[AUTH_DEBUG] response=${err.response?.data}');
    if (err.response?.statusCode == 401) {
      // Token is invalid or expired
      ref.read(authViewModelProvider.notifier).forceLogoutOnSessionExpired();
    }
    return handler.next(err);
  }
}

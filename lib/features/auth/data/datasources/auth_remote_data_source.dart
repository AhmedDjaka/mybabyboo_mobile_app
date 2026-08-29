import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/registration_draft.dart';
import '../../../../core/network/dio_client.dart'; // Assume this exists or adapt
import '../../../../core/network/api_endpoints.dart';

part 'auth_remote_data_source.g.dart';

class AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSource(this._dio);

  Future<Map<String, dynamic>> startRegistration(String phone) async {
    final response = await _dio.post(
      ApiEndpoints.authRegistrationStart,
      data: {'phone': phone},
    );
    return response.data;
  }

  Future<String> verifyRegistration(String verificationId, String code) async {
    final response = await _dio.post(
      ApiEndpoints.authRegistrationVerify,
      data: {'verification_id': verificationId, 'code': code},
    );
    return response.data['verification_token'];
  }

  Future<Map<String, dynamic>> resendRegistrationOtp(
    String verificationId,
  ) async {
    final response = await _dio.post(
      ApiEndpoints.authRegistrationResend,
      data: {'verification_id': verificationId},
    );
    return response.data;
  }

  Future<Map<String, dynamic>> completeRegistration(
    RegistrationDraft draft,
  ) async {
    final response = await _dio.post(
      ApiEndpoints.authRegistrationComplete,
      data: {
        'first_name': draft.firstName,
        'last_name': draft.lastName,
        'phone': draft.phone,
        'password': draft.password,
        'password_confirmation': draft.password, // Confirming on client side
        'email': draft.email.isNotEmpty ? draft.email : null,
        'accepted_terms': draft.acceptedTerms,
        'verification_token': draft.verificationToken,
      },
    );
    return response.data;
  }

  Future<Map<String, dynamic>> login(String phone, String password) async {
    final response = await _dio.post(
      ApiEndpoints.authLogin,
      data: {'phone': phone, 'password': password},
    );
    return response.data;
  }

  Future<Map<String, dynamic>> me() async {
    final response = await _dio.get(ApiEndpoints.authMe);
    return response.data as Map<String, dynamic>;
  }

  Future<void> forgotPassword(String phone) async {
    await _dio.post(ApiEndpoints.authPasswordForgot, data: {'phone': phone});
  }

  Future<void> verifyPasswordReset(String phone, String code) async {
    await _dio.post(
      ApiEndpoints.authPasswordVerify,
      data: {'phone': phone, 'code': code},
    );
  }

  Future<void> resetPassword(String phone, String password) async {
    await _dio.post(
      ApiEndpoints.authPasswordReset,
      data: {
        'phone': phone,
        'password': password,
        'password_confirmation': password,
      },
    );
  }
}

@riverpod
AuthRemoteDataSource authRemoteDataSource(AuthRemoteDataSourceRef ref) {
  return AuthRemoteDataSource(ref.watch(dioClientProvider));
}

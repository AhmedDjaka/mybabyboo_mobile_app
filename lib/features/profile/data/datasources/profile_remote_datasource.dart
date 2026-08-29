import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_client.dart';
import '../models/user_profile_model.dart';

part 'profile_remote_datasource.g.dart';

class ProfileRemoteDatasource {
  final Dio _dio;

  const ProfileRemoteDatasource(this._dio);

  Future<UserProfileModel?> getProfile() async {
    final response = await _dio.get('/api/v1/profile');
    final data = response.data;
    if (data['profile'] == null) return null;
    return UserProfileModel.fromJson(data['profile'] as Map<String, dynamic>);
  }

  Future<UserProfileModel> updateProfile({
    required String displayName,
    DateTime? birthDate,
    required String countryCode,
    String? city,
    required String locale,
    required bool voiceAssistanceEnabled,
  }) async {
    final response = await _dio.put(
      '/api/v1/profile',
      data: {
        'display_name': displayName,
        'birth_date': birthDate != null
            ? '${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}'
            : null,
        'country_code': countryCode,
        'city': city,
        'locale': locale,
        'voice_assistance_enabled': voiceAssistanceEnabled,
      },
    );
    return UserProfileModel.fromJson(
      response.data['profile'] as Map<String, dynamic>,
    );
  }

  Future<String> uploadProfilePhoto(String imagePath) async {
    final formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(imagePath),
    });

    final response = await _dio.post('/api/v1/profile/photo', data: formData);

    return response.data['profile_photo_url'] as String;
  }

  Future<void> deleteProfilePhoto() async {
    await _dio.delete('/api/v1/profile/photo');
  }
}

@riverpod
ProfileRemoteDatasource profileRemoteDatasource(
  ProfileRemoteDatasourceRef ref,
) {
  return ProfileRemoteDatasource(ref.watch(dioClientProvider));
}

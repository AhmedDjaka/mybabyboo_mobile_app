import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_datasource.dart';
import '../models/user_profile_mapper.dart';

part 'profile_repository_impl.g.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDatasource _datasource;

  const ProfileRepositoryImpl(this._datasource);

  @override
  Future<UserProfile?> getProfile() async {
    final model = await _datasource.getProfile();
    return model?.toEntity();
  }

  @override
  Future<UserProfile> updateProfile({
    required String displayName,
    DateTime? birthDate,
    required String countryCode,
    String? city,
    required String locale,
    required bool voiceAssistanceEnabled,
  }) async {
    final model = await _datasource.updateProfile(
      displayName: displayName,
      birthDate: birthDate,
      countryCode: countryCode,
      city: city,
      locale: locale,
      voiceAssistanceEnabled: voiceAssistanceEnabled,
    );
    return model.toEntity();
  }

  @override
  Future<String> uploadProfilePhoto(String imagePath) async {
    return _datasource.uploadProfilePhoto(imagePath);
  }

  @override
  Future<void> deleteProfilePhoto() async {
    return _datasource.deleteProfilePhoto();
  }
}

@riverpod
ProfileRepository profileRepository(ProfileRepositoryRef ref) {
  return ProfileRepositoryImpl(ref.watch(profileRemoteDatasourceProvider));
}

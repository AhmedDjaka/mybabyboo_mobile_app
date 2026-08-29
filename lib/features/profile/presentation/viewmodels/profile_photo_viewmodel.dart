import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../../../home/presentation/viewmodels/home_viewmodel.dart';

part 'profile_photo_viewmodel.g.dart';

@riverpod
class ProfilePhotoViewModel extends _$ProfilePhotoViewModel {
  @override
  AsyncValue<void> build() {
    return const AsyncValue.data(null);
  }

  Future<void> uploadPhoto(String imagePath) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(profileRepositoryProvider);
      await repository.uploadProfilePhoto(imagePath);
      state = const AsyncValue.data(null);

      // Refresh HomeSummary to get the new photo URL
      ref.read(homeViewModelProvider.notifier).refresh();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> deletePhoto() async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(profileRepositoryProvider);
      await repository.deleteProfilePhoto();
      state = const AsyncValue.data(null);

      // Refresh HomeSummary to remove the photo URL
      ref.read(homeViewModelProvider.notifier).refresh();
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

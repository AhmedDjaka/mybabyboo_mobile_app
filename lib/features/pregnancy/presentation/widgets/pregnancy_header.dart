import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../home/presentation/viewmodels/home_viewmodel.dart';
import '../../../home/presentation/state/home_state.dart';
import '../../../profile/presentation/viewmodels/profile_photo_viewmodel.dart';
import 'package:image_picker/image_picker.dart';

class PregnancyHeader extends ConsumerWidget {
  const PregnancyHeader({super.key});

  void _showNotificationUnavailable(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Bientôt disponible'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showAvatarBottomSheet(
    BuildContext context,
    WidgetRef ref,
    String? profilePhotoUrl,
  ) async {
    final action = await showModalBottomSheet<String>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Photo de profil',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 16),
                ListTile(
                  leading: const Icon(
                    Icons.photo_library_rounded,
                    color: AppColors.primary,
                  ),
                  title: Text(
                    profilePhotoUrl == null
                        ? 'Choisir dans la galerie'
                        : 'Choisir une autre photo',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () => Navigator.pop(ctx, 'upload'),
                ),
                if (profilePhotoUrl != null)
                  ListTile(
                    leading: const Icon(
                      Icons.delete_rounded,
                      color: Colors.redAccent,
                    ),
                    title: const Text(
                      'Supprimer la photo',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: Colors.redAccent,
                      ),
                    ),
                    onTap: () => Navigator.pop(ctx, 'delete'),
                  ),
                ListTile(
                  leading: const Icon(
                    Icons.close_rounded,
                    color: AppColors.textSecondary,
                  ),
                  title: const Text(
                    'Annuler',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  onTap: () => Navigator.pop(ctx),
                ),
              ],
            ),
          ),
        );
      },
    );

    if (action == 'upload') {
      final picker = ImagePicker();
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        ref
            .read(profilePhotoViewModelProvider.notifier)
            .uploadPhoto(image.path);
      }
    } else if (action == 'delete') {
      ref.read(profilePhotoViewModelProvider.notifier).deletePhoto();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // We can get the user info from homeViewModelProvider since it loads user profile
    final homeState = ref.watch(homeViewModelProvider);
    final isUploading = ref.watch(profilePhotoViewModelProvider).isLoading;

    String? profilePhotoUrl = homeState.mapOrNull(
      loaded: (state) => state.summary.user.profilePhotoUrl,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(
          child: Text(
            'Ma grossesse',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins',
              color: AppColors.textPrimary,
              height: 1.2,
            ),
          ),
        ),
        const SizedBox(width: 12),
        IconButton(
          icon: const Icon(Icons.notifications_rounded),
          color: AppColors.primary,
          iconSize: 26,
          splashRadius: 24,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () => _showNotificationUnavailable(context),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: () => _showAvatarBottomSheet(context, ref, profilePhotoUrl),
          child: Semantics(
            label: 'Profil',
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primaryContainer,
                  width: 1.5,
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipOval(
                    child: profilePhotoUrl != null
                        ? Image.network(
                            profilePhotoUrl,
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/illustrations/home/home_avatar_fallback.png',
                                width: 48,
                                height: 48,
                                fit: BoxFit.cover,
                              );
                            },
                          )
                        : Image.asset(
                            'assets/illustrations/home/home_avatar_fallback.png',
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                          ),
                  ),
                  if (isUploading)
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        shape: BoxShape.circle,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

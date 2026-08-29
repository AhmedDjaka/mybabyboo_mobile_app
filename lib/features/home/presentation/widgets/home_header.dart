import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final String displayName;
  final String? profilePhotoUrl;
  final bool isUploading;
  final VoidCallback onAvatarUpload;
  final VoidCallback onAvatarDelete;

  const HomeHeader({
    super.key,
    required this.displayName,
    this.profilePhotoUrl,
    this.isUploading = false,
    required this.onAvatarUpload,
    required this.onAvatarDelete,
  });

  void _showNotificationUnavailable(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Bientôt disponible'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showAvatarBottomSheet(BuildContext context) async {
    debugPrint('[PROFILE PHOTO] bottom sheet opened');
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
                    color: Color(0xFF4A3043),
                  ),
                ),
                const SizedBox(height: 16),
                ListTile(
                  leading: const Icon(
                    Icons.photo_library_rounded,
                    color: Color(0xFFF08EA2),
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
                  onTap: () {
                    debugPrint('[PROFILE PHOTO] gallery action tapped');
                    Navigator.pop(ctx, 'upload');
                  },
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
                    onTap: () {
                      Navigator.pop(ctx, 'delete');
                    },
                  ),
                ListTile(
                  leading: const Icon(
                    Icons.close_rounded,
                    color: Color(0xFF806A78),
                  ),
                  title: const Text(
                    'Annuler',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF806A78),
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

    debugPrint('[PROFILE PHOTO] bottom sheet closed with action: $action');
    if (action == 'upload') {
      onAvatarUpload();
    } else if (action == 'delete') {
      onAvatarDelete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Bonjour $displayName 💕',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                  color: Color(0xFF4A3043),
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'Tu fais un travail incroyable.\nOn est là pour t\'accompagner.',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Quicksand',
                  color: Color(0xFF806A78),
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        IconButton(
          icon: const Icon(Icons.notifications_rounded),
          color: const Color(0xFFF08EA2),
          iconSize: 26,
          splashRadius: 24,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () => _showNotificationUnavailable(context),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: () => _showAvatarBottomSheet(context),
          child: Semantics(
            label: 'Profil de $displayName',
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFFAD6E1), width: 1.5),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipOval(
                    child: profilePhotoUrl != null
                        ? Image.network(
                            profilePhotoUrl!,
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
                        color: Colors.white.withValues(alpha: 0.6),
                        shape: BoxShape.circle,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFFF08EA2),
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

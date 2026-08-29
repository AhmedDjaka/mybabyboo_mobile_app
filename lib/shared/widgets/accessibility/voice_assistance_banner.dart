import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/theme/app_colors.dart';
import '../../../core/accessibility/voice_preferences_provider.dart';

/// Bannière compacte de préférence d'assistance vocale.
/// Utilise [voicePreferencesProvider] comme source de vérité unique.
/// L'état survit aux rebuilds, aux navigations et aux retours arrière.
class VoiceAssistanceBanner extends ConsumerWidget {
  const VoiceAssistanceBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnabled = ref.watch(isVoiceAssistanceEnabledProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 8,
              right: 2,
              top: 2,
              bottom: 2,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColors.borderSoft, width: 1.5),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.record_voice_over,
                  color: AppColors.secondary,
                  size: 14,
                ),
                const SizedBox(width: 4),
                const Text(
                  "Aide vocale",
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 4),
                Transform.scale(
                  scale: 0.65,
                  child: Switch(
                    value: isEnabled,
                    activeThumbColor: Colors.white,
                    activeTrackColor: AppColors.primary,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onChanged: (value) {
                      ref
                          .read(voicePreferencesProvider.notifier)
                          .setEnabled(value);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

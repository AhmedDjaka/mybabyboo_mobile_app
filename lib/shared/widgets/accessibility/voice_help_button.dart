import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/theme/app_colors.dart';
import '../../../core/audio/tts_service.dart';
import '../../../core/accessibility/voice_preferences_provider.dart';

class VoiceHelpButton extends ConsumerWidget {
  final String textToRead;
  final bool isFilled;

  const VoiceHelpButton({
    super.key,
    required this.textToRead,
    this.isFilled = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnabled = ref.watch(isVoiceAssistanceEnabledProvider);

    if (!isEnabled) {
      return const SizedBox.shrink();
    }

    final tts = ref.read(ttsServiceProvider);

    if (isFilled) {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(
            Icons.volume_up_rounded,
            color: Colors.white,
            size: 20,
          ),
          tooltip: 'Écouter les instructions',
          onPressed: () => tts.speak(textToRead),
        ),
      );
    }

    return IconButton(
      icon: Icon(Icons.volume_up_rounded, color: AppColors.primary),
      tooltip: 'Écouter les instructions',
      onPressed: () => tts.speak(textToRead),
    );
  }
}

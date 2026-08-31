import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/theme/app_colors.dart';
import '../../../core/audio/tts_service.dart';
import '../../../core/accessibility/voice_preferences_provider.dart';

class VoiceHelpButton extends ConsumerStatefulWidget {
  final String textToRead;
  final bool isFilled;
  final bool isManualAction;

  const VoiceHelpButton({
    super.key,
    required this.textToRead,
    this.isFilled = false,
    this.isManualAction = false,
  });

  @override
  ConsumerState<VoiceHelpButton> createState() => _VoiceHelpButtonState();
}

class _VoiceHelpButtonState extends ConsumerState<VoiceHelpButton> {
  bool _isPlaying = false;

  Future<void> _handlePress() async {
    if (_isPlaying) return;

    setState(() => _isPlaying = true);

    final tts = ref.read(ttsServiceProvider);
    tts.speak(widget.textToRead);

    // Provide a visual feedback duration since we might not have a reliable TTS completion callback
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() => _isPlaying = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled = ref.watch(isVoiceAssistanceEnabledProvider);

    if (!isEnabled && !widget.isManualAction) {
      return const SizedBox.shrink();
    }

    final icon = _isPlaying
        ? Icons.graphic_eq_rounded
        : Icons.volume_up_rounded;

    if (widget.isFilled) {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: Icon(icon, color: Colors.white, size: 20),
          tooltip: 'Écouter les instructions',
          onPressed: _handlePress,
        ),
      );
    }

    return IconButton(
      icon: Icon(icon, color: AppColors.primary),
      tooltip: 'Écouter les instructions',
      onPressed: _handlePress,
    );
  }
}

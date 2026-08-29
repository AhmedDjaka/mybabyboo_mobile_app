import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/audio/tts_service.dart';

class DailyMamaCard extends StatelessWidget {
  final String? dailyMessage;

  const DailyMamaCard({super.key, this.dailyMessage});

  @override
  Widget build(BuildContext context) {
    final message =
        dailyMessage ?? 'Prenez un petit moment pour vous aujourd\'hui 💕';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF6F8),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF8B5D7A).withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.format_quote_rounded,
            color: Color(0xFFF08EA2),
            size: 28,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pour vous aujourd\'hui',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    color: Color(0xFF4A3043),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 13,
                    fontFamily: 'Quicksand',
                    color: Color(0xFF806A78),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          _DailyMamaAudioButton(textToRead: message),
        ],
      ),
    );
  }
}

class _DailyMamaAudioButton extends ConsumerWidget {
  final String textToRead;

  const _DailyMamaAudioButton({required this.textToRead});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tts = ref.watch(ttsServiceProvider);

    return ValueListenableBuilder<bool>(
      valueListenable: tts.isPlaying,
      builder: (context, isPlaying, child) {
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF08EA2),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFF08EA2).withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(
              isPlaying ? Icons.stop_rounded : Icons.volume_up_rounded,
              color: Colors.white,
              size: 24,
            ),
            tooltip: isPlaying ? 'Arrêter la lecture' : 'Écouter le message',
            onPressed: () async {
              debugPrint('[DailyMamaTTS] button tapped');
              debugPrint('[DailyMamaTTS] text="$textToRead"');
              debugPrint('[DailyMamaTTS] text length=${textToRead.length}');
              if (isPlaying) {
                debugPrint('[DailyMamaTTS] calling stop()');
                tts.stop();
              } else {
                final cleanText = textToRead.replaceAll(
                  RegExp(r'[^\p{L}\p{N}\p{P}\p{Z}]', unicode: true),
                  '',
                );
                debugPrint('[DailyMamaTTS] cleaned text="$cleanText"');
                debugPrint('[DailyMamaTTS] calling speak()');
                await tts.speak(cleanText);

                // TEMP TEST: test direct avec phrase hardcodée si besoin.
                // Décommentez la ligne ci-dessous si cleanText ne fonctionne pas.
                // await tts.speak("Bonjour Queen, ceci est un test de lecture vocale.");
              }
            },
          ),
        );
      },
    );
  }
}

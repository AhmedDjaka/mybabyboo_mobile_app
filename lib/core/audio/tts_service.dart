import 'package:flutter_tts/flutter_tts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/foundation.dart';
import '../accessibility/voice_preferences_provider.dart';

part 'tts_service.g.dart';

/// Service TTS (Text-to-Speech).
/// Gère uniquement le moteur TTS (parole, arrêt).
/// La préférence utilisateur (activé/désactivé) est dans [voicePreferencesProvider].
class TtsService {
  final FlutterTts _flutterTts;

  TtsService(this._flutterTts) {
    _initTts();
  }

  final ValueNotifier<bool> isPlaying = ValueNotifier(false);

  Future<void> _initTts() async {
    debugPrint('[TtsService] Initializing TTS...');
    await _flutterTts.awaitSpeakCompletion(true);

    final languages = await _flutterTts.getLanguages;
    debugPrint('[TtsService] Available languages: $languages');

    final engines = await _flutterTts.getEngines;
    debugPrint('[TtsService] Available engines: $engines');

    final isFrSupported = await _flutterTts.isLanguageAvailable("fr-FR");
    debugPrint('[TtsService] fr-FR available: $isFrSupported');

    if (isFrSupported) {
      await _flutterTts.setLanguage("fr-FR");
    } else {
      debugPrint('[TtsService] WARNING: fr-FR not available on this device!');
      // fallback to fr if fr-FR not specifically available
      final isFrSupportedShort = await _flutterTts.isLanguageAvailable("fr");
      if (isFrSupportedShort) {
        await _flutterTts.setLanguage("fr");
      }
    }

    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.setVolume(1.0);
    await _flutterTts.setPitch(1.0);
    debugPrint('[TtsService] TTS config done.');

    _flutterTts.setStartHandler(() {
      debugPrint('[TtsService] handler: speech started');
      isPlaying.value = true;
    });
    _flutterTts.setCompletionHandler(() {
      debugPrint('[TtsService] handler: speech completed');
      isPlaying.value = false;
    });
    _flutterTts.setCancelHandler(() {
      debugPrint('[TtsService] handler: speech canceled');
      isPlaying.value = false;
    });
    _flutterTts.setErrorHandler((msg) {
      debugPrint('[TtsService] handler: error - $msg');
      isPlaying.value = false;
    });
  }

  Future<void> speak(String text) async {
    debugPrint(
      '[TtsService] Executing _flutterTts.speak() for text of length ${text.length}',
    );
    try {
      final result = await _flutterTts.speak(text);
      debugPrint('[TtsService] _flutterTts.speak() returned: $result');
    } catch (e) {
      debugPrint('[TtsService] _flutterTts.speak() exception: $e');
    }
  }

  Future<void> stop() async {
    debugPrint('[TtsService] Executing _flutterTts.stop()');
    await _flutterTts.stop();
  }
}

@riverpod
TtsService ttsService(TtsServiceRef ref) {
  final tts = TtsService(FlutterTts());
  ref.onDispose(tts.stop);
  return tts;
}

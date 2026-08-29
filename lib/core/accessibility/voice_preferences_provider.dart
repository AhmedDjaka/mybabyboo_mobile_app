import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kVoiceAssistanceKey = 'voice_assistance_enabled';

/// Provider global de préférence vocale.
/// Source de vérité unique partagée par Auth, Profile Setup et Pregnancy Setup.
/// L'état est persisté dans SharedPreferences et survit aux navigations/rebuilds.
class VoicePreferencesNotifier extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_kVoiceAssistanceKey) ?? false;
  }

  Future<void> setEnabled(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kVoiceAssistanceKey, value);
    state = AsyncValue.data(value);
  }
}

final voicePreferencesProvider =
    AsyncNotifierProvider<VoicePreferencesNotifier, bool>(
      VoicePreferencesNotifier.new,
    );

/// Provider synchrone pour lire rapidement la préférence dans les widgets.
/// Retourne false si non encore chargé (valeur par défaut sûre).
final isVoiceAssistanceEnabledProvider = Provider<bool>((ref) {
  return ref.watch(voicePreferencesProvider).valueOrNull ?? false;
});

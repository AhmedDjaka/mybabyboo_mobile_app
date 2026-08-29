import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'has_seen_onboarding_provider.g.dart';

const String _kHasSeenOnboardingKey = 'hasSeenOnboarding';

@riverpod
class HasSeenOnboarding extends _$HasSeenOnboarding {
  @override
  bool build() {
    return false;
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getBool(_kHasSeenOnboardingKey) ?? false;
  }

  Future<void> setHasSeen(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kHasSeenOnboardingKey, value);
    state = value;
  }
}

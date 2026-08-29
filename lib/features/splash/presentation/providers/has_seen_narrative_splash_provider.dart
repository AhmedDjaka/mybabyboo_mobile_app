import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'has_seen_narrative_splash_provider.g.dart';

const String _kHasSeenNarrativeSplashKey = 'hasSeenNarrativeSplash';

@riverpod
class HasSeenNarrativeSplash extends _$HasSeenNarrativeSplash {
  @override
  bool build() {
    return false;
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getBool(_kHasSeenNarrativeSplashKey) ?? false;
  }

  Future<void> setHasSeen(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kHasSeenNarrativeSplashKey, value);
    state = value;
  }
}

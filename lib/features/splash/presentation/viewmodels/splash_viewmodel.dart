import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../state/splash_state.dart';
import '../providers/has_seen_narrative_splash_provider.dart';
import '../../../onboarding/presentation/providers/has_seen_onboarding_provider.dart';
import '../../../../app/theme/app_durations.dart';
import 'splash_scene_data.dart';

part 'splash_viewmodel.g.dart';

@riverpod
class SplashViewModel extends _$SplashViewModel {
  Timer? _timer;
  bool _isDisposed = false;

  @override
  SplashState build() {
    ref.onDispose(() {
      _isDisposed = true;
      _timer?.cancel();
    });
    return const SplashState.initializing();
  }

  Future<void> onAnimationFinished() async {
    _timer?.cancel();
    final hasSeenNotifier = ref.read(hasSeenNarrativeSplashProvider.notifier);
    await hasSeenNotifier.setHasSeen(true);

    final hasSeenOnboardingNotifier = ref.read(
      hasSeenOnboardingProvider.notifier,
    );
    await hasSeenOnboardingNotifier.load();
    final hasSeenOnboarding = ref.read(hasSeenOnboardingProvider);

    final String nextRoute = hasSeenOnboarding ? '/auth' : '/onboarding';

    if (!_isDisposed) {
      state = SplashState.completed(nextRoute: nextRoute);
    }
  }

  Future<void> skipAnimation() async {
    await onAnimationFinished();
  }

  Future<void> initializeApp(bool reduceMotion) async {
    state = const SplashState.initializing();
    try {
      final hasSeenNotifier = ref.read(hasSeenNarrativeSplashProvider.notifier);
      await hasSeenNotifier.load();
      final hasSeen = ref.read(hasSeenNarrativeSplashProvider);

      if (_isDisposed) return;

      if (hasSeen || reduceMotion) {
        state = const SplashState.playingShort();
        _timer = Timer(const Duration(milliseconds: 1500), () {
          if (!_isDisposed) onAnimationFinished();
        });
      } else {
        _playNarrativeSequence();
      }
    } catch (e) {
      if (!_isDisposed) {
        state = SplashState.error(message: 'Erreur d\'initialisation : $e');
      }
    }
  }

  void _playNarrativeSequence() {
    int currentIndex = 0;

    void scheduleNext() {
      if (_isDisposed) return;

      if (currentIndex >= splashNarrativeScenes.length) {
        // Logo final
        state = const SplashState.playingNarrative(currentSceneIndex: -1);
        _timer = Timer(AppDurations.splashLogoReveal, () {
          if (!_isDisposed) onAnimationFinished();
        });
        return;
      }

      state = SplashState.playingNarrative(currentSceneIndex: currentIndex);
      final duration = splashNarrativeScenes[currentIndex].duration;

      currentIndex++;
      _timer = Timer(duration, scheduleNext);
    }

    scheduleNext();
  }
}

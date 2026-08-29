import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:baby_mama/features/splash/presentation/state/splash_state.dart';
import 'package:baby_mama/features/splash/presentation/viewmodels/splash_viewmodel.dart';
import 'package:baby_mama/features/splash/presentation/viewmodels/splash_scene_data.dart';
import 'package:baby_mama/features/splash/presentation/providers/has_seen_narrative_splash_provider.dart';
import 'package:baby_mama/app/theme/app_durations.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  // ─── Tests sur les données de scènes ───────────────────────────────────────

  group('splashNarrativeScenes', () {
    test('contient exactement 5 scènes', () {
      expect(splashNarrativeScenes.length, 5);
    });

    test('les ids sont corrects', () {
      expect(splashNarrativeScenes[0].id, 'woman');
      expect(splashNarrativeScenes[1].id, 'pregnant');
      expect(splashNarrativeScenes[2].id, 'journey');
      expect(splashNarrativeScenes[3].id, 'hospital');
      expect(splashNarrativeScenes[4].id, 'mother_baby');
    });

    test('les titres sont corrects', () {
      expect(splashNarrativeScenes[0].title, 'Une histoire commence...');
      expect(splashNarrativeScenes[1].title, 'Une petite vie grandit...');
      expect(splashNarrativeScenes[2].title, 'Chaque semaine compte.');
      expect(splashNarrativeScenes[3].title, 'Le grand jour approche...');
      expect(splashNarrativeScenes[4].title, 'Une nouvelle histoire commence.');
    });

    test('les assets Lottie sont corrects', () {
      expect(
        splashNarrativeScenes[0].lottieAsset,
        'assets/animations/splash/01_pregnancy_test.json',
      );
      expect(
        splashNarrativeScenes[1].lottieAsset,
        'assets/animations/splash/02_pregnant_woman.json',
      );
      expect(
        splashNarrativeScenes[2].lottieAsset,
        'assets/animations/splash/03_pregnancy_weeks.json',
      );
      expect(
        splashNarrativeScenes[3].lottieAsset,
        'assets/animations/splash/04_ultrasound.json',
      );
      expect(
        splashNarrativeScenes[4].lottieAsset,
        'assets/animations/splash/05_mother_baby.json',
      );
    });

    test('les durées sont correctes', () {
      expect(splashNarrativeScenes[0].duration, AppDurations.splashScene1);
      expect(splashNarrativeScenes[1].duration, AppDurations.splashScene2);
      expect(splashNarrativeScenes[2].duration, AppDurations.splashScene3);
      expect(splashNarrativeScenes[3].duration, AppDurations.splashScene4);
      expect(splashNarrativeScenes[4].duration, AppDurations.splashScene5);

      // Nouvelles durées contemplatives définitives
      expect(splashNarrativeScenes[0].duration.inMilliseconds, 3000);
      expect(splashNarrativeScenes[1].duration.inMilliseconds, 3000);
      expect(splashNarrativeScenes[2].duration.inMilliseconds, 3200);
      expect(splashNarrativeScenes[3].duration.inMilliseconds, 3200);
      expect(splashNarrativeScenes[4].duration.inMilliseconds, 3500);
    });

    test('durée totale narrative ~ 13 secondes (hors logo)', () {
      final total = splashNarrativeScenes.fold<int>(
        0,
        (sum, scene) => sum + scene.duration.inMilliseconds,
      );
      // 3000 + 3000 + 3200 + 3200 + 3500 = 15900 ms (+ 1800 logo = 17700)
      expect(total, 15900);
    });
  });

  // ─── Tests ViewModel ───────────────────────────────────────────────────────

  test("L'état initial du splash est initializing", () {
    final state = container.read(splashViewModelProvider);
    expect(state, const SplashState.initializing());
  });

  test(
    'initializeApp (first launch) passe de initializing à playingNarrative',
    () async {
      final sub = container.listen(splashViewModelProvider, (_, _) {});

      final viewModel = container.read(splashViewModelProvider.notifier);
      await viewModel.initializeApp(false);

      final state = container.read(splashViewModelProvider);
      expect(state, const SplashState.playingNarrative(currentSceneIndex: 0));
      sub.close();
    },
  );

  test('initializeApp (subsequent launch) passe à playingShort', () async {
    SharedPreferences.setMockInitialValues({'hasSeenNarrativeSplash': true});
    final sub = container.listen(splashViewModelProvider, (_, _) {});

    final viewModel = container.read(splashViewModelProvider.notifier);
    await viewModel.initializeApp(false);

    final state = container.read(splashViewModelProvider);
    expect(state, const SplashState.playingShort());
    sub.close();
  });

  test('initializeApp (reduce motion) passe à playingShort', () async {
    final sub = container.listen(splashViewModelProvider, (_, _) {});

    final viewModel = container.read(splashViewModelProvider.notifier);
    await viewModel.initializeApp(true); // reduceMotion = true

    final state = container.read(splashViewModelProvider);
    expect(state, const SplashState.playingShort());
    sub.close();
  });

  test(
    'onAnimationFinished (hasSeenOnboarding = false) → completed /onboarding',
    () async {
      SharedPreferences.setMockInitialValues({'hasSeenOnboarding': false});
      final sub = container.listen(splashViewModelProvider, (_, _) {});
      final subPrefs = container.listen(
        hasSeenNarrativeSplashProvider,
        (_, _) {},
      );

      final viewModel = container.read(splashViewModelProvider.notifier);
      await viewModel.onAnimationFinished();

      final state = container.read(splashViewModelProvider);
      expect(state, const SplashState.completed(nextRoute: '/onboarding'));

      final hasSeen = container.read(hasSeenNarrativeSplashProvider);
      expect(hasSeen, true);

      sub.close();
      subPrefs.close();
    },
  );

  test(
    'onAnimationFinished (hasSeenOnboarding = true) → completed /auth',
    () async {
      SharedPreferences.setMockInitialValues({'hasSeenOnboarding': true});
      final sub = container.listen(splashViewModelProvider, (_, _) {});
      final subPrefs = container.listen(
        hasSeenNarrativeSplashProvider,
        (_, _) {},
      );

      final viewModel = container.read(splashViewModelProvider.notifier);
      await viewModel.onAnimationFinished();

      final state = container.read(splashViewModelProvider);
      expect(state, const SplashState.completed(nextRoute: '/auth'));

      sub.close();
      subPrefs.close();
    },
  );

  test('skipAnimation équivaut à onAnimationFinished', () async {
    SharedPreferences.setMockInitialValues({'hasSeenOnboarding': false});
    final sub = container.listen(splashViewModelProvider, (_, _) {});

    final viewModel = container.read(splashViewModelProvider.notifier);
    await viewModel.skipAnimation();

    final state = container.read(splashViewModelProvider);
    expect(state, const SplashState.completed(nextRoute: '/onboarding'));

    final hasSeen = container.read(hasSeenNarrativeSplashProvider);
    expect(hasSeen, true);

    sub.close();
  });
}

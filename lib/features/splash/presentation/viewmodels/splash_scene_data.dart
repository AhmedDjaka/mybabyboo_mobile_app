import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_durations.dart';
import '../../../../app/theme/app_gradients.dart';

/// Enum representing the background style for a splash scene.
enum SplashBackgroundType {
  primaryContainer,
  pregnancyGradient,
  primary,
  background,
  warmGradient,
}

/// Helper to convert a [SplashBackgroundType] to a concrete [BoxDecoration].
BoxDecoration decorationForBackground(SplashBackgroundType type) {
  switch (type) {
    case SplashBackgroundType.primaryContainer:
      return const BoxDecoration(color: AppColors.primaryContainer);
    case SplashBackgroundType.pregnancyGradient:
      return const BoxDecoration(gradient: AppGradients.pregnancyGradient);
    case SplashBackgroundType.primary:
      return const BoxDecoration(color: AppColors.primary);
    case SplashBackgroundType.background:
      return const BoxDecoration(color: AppColors.background);
    case SplashBackgroundType.warmGradient:
      return const BoxDecoration(gradient: AppGradients.warmGradient);
  }
}

/// Data for a splash narrative scene.
class SplashSceneData {
  const SplashSceneData({
    required this.id,
    required this.title,
    required this.duration,
    required this.lottieAsset,
    required this.backgroundType,
  });

  final String id;
  final String title;
  final Duration duration;
  final String lottieAsset;
  final SplashBackgroundType backgroundType;

  /// Returns the [BoxDecoration] for this scene's background.
  BoxDecoration get backgroundDecoration =>
      decorationForBackground(backgroundType);
}

// Full‑animation narrative scenes (used when Reduce Motion is off).
final List<SplashSceneData> splashNarrativeScenes = [
  SplashSceneData(
    id: 'woman',
    title: 'Une histoire commence...',
    duration: AppDurations.splashScene1,
    lottieAsset: 'assets/animations/splash/01_pregnancy_test.json',
    backgroundType: SplashBackgroundType.primaryContainer,
  ),
  SplashSceneData(
    id: 'pregnant',
    title: 'Une petite vie grandit...',
    duration: AppDurations.splashScene2,
    lottieAsset: 'assets/animations/splash/02_pregnant_woman.json',
    backgroundType: SplashBackgroundType.pregnancyGradient,
  ),
  SplashSceneData(
    id: 'journey',
    title: 'Chaque semaine compte.',
    duration: AppDurations.splashScene3,
    lottieAsset: 'assets/animations/splash/03_pregnancy_weeks.json',
    backgroundType: SplashBackgroundType.primaryContainer,
  ),
  SplashSceneData(
    id: 'hospital',
    title: 'Le grand jour approche...',
    duration: AppDurations.splashScene4,
    lottieAsset: 'assets/animations/splash/04_ultrasound.json',
    backgroundType: SplashBackgroundType.background,
  ),
  SplashSceneData(
    id: 'mother_baby',
    title: 'Une nouvelle histoire commence.',
    duration: AppDurations.splashScene5,
    lottieAsset: 'assets/animations/splash/05_mother_baby.json',
    backgroundType: SplashBackgroundType.warmGradient,
  ),
];

// Reduced‑motion / simplified sequence (static frames, shorter timings).
final List<SplashSceneData> splashNarrativeScenesReduced = [
  SplashSceneData(
    id: 'woman',
    title: 'Une histoire commence...',
    duration: const Duration(milliseconds: 500),
    lottieAsset: 'assets/animations/splash/01_pregnancy_test.json',
    backgroundType: SplashBackgroundType.primaryContainer,
  ),
  SplashSceneData(
    id: 'pregnant',
    title: 'Une petite vie grandit...',
    duration: const Duration(milliseconds: 500),
    lottieAsset: 'assets/animations/splash/02_pregnant_woman.json',
    backgroundType: SplashBackgroundType.pregnancyGradient,
  ),
  SplashSceneData(
    id: 'journey',
    title: 'Chaque semaine compte.',
    duration: const Duration(milliseconds: 500),
    lottieAsset: 'assets/animations/splash/03_pregnancy_weeks.json',
    backgroundType: SplashBackgroundType.primaryContainer,
  ),
  SplashSceneData(
    id: 'hospital',
    title: 'Le grand jour approche...',
    duration: const Duration(milliseconds: 500),
    lottieAsset: 'assets/animations/splash/04_ultrasound.json',
    backgroundType: SplashBackgroundType.background,
  ),
  SplashSceneData(
    id: 'mother_baby',
    title: 'Une nouvelle histoire commence.',
    duration: const Duration(milliseconds: 700),
    lottieAsset: 'assets/animations/splash/05_mother_baby.json',
    backgroundType: SplashBackgroundType.warmGradient,
  ),
];

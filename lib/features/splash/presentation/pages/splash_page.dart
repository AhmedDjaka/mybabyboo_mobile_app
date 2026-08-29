import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_durations.dart';
import '../../../../app/theme/app_spacing.dart';
import '../state/splash_state.dart';
import '../viewmodels/splash_viewmodel.dart';
import '../viewmodels/splash_scene_data.dart';
import '../widgets/splash_lottie_illustration.dart';
import '../widgets/splash_logo_reveal.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage>
    with SingleTickerProviderStateMixin {
  // ─── AnimationController unique pour les Lottie ───────────────────────────
  late final AnimationController _lottieController;

  // Index de la scène actuellement affichée — permet de détecter les
  // changements pour reset + relancer le controller.
  int _lastSceneIndex = -2;

  @override
  void initState() {
    super.initState();

    // Durée initiale = scène 1 ; sera mise à jour dans onLoaded.
    _lottieController = AnimationController(
      vsync: this,
      duration: AppDurations.splashScene1,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final reduceMotion = MediaQuery.of(context).disableAnimations;
      ref.read(splashViewModelProvider.notifier).initializeApp(reduceMotion);
    });
  }

  @override
  void dispose() {
    _lottieController.dispose();
    super.dispose();
  }

  // ─── Lance le controller pour la scène courante ────────────────────────────
  void _startLottieForScene(SplashSceneData scene) {
    _lottieController
      ..stop()
      ..duration = scene.duration
      ..forward(from: 0.0);

    if (kDebugMode) {
      debugPrint(
        '[SplashPage] Scène ${scene.id} — controller démarré '
        '(durée cible : ${scene.duration.inMilliseconds}ms)',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final reduceMotion = MediaQuery.of(context).disableAnimations;

    ref.listen<SplashState>(splashViewModelProvider, (previous, next) {
      next.maybeWhen(
        completed: (nextRoute) {
          if (mounted) context.go(nextRoute);
        },
        orElse: () {},
      );
    });

    final splashState = ref.watch(splashViewModelProvider);

    return Scaffold(
      body: splashState.maybeWhen(
        playingNarrative: (currentIndex) =>
            _buildNarrative(context, currentIndex, reduceMotion),
        playingShort: () => _buildShort(context),
        orElse: () => const ColoredBox(color: AppColors.background),
      ),
    );
  }

  Widget _buildNarrative(
    BuildContext context,
    int currentIndex,
    bool reduceMotion,
  ) {
    // ── Logo final (scène index = -1) ────────────────────────────────────────
    if (currentIndex == -1) {
      _lottieController.stop();
      return const ColoredBox(
        color: AppColors.background,
        child: Center(child: SplashLogoReveal(opacity: 1.0, scale: 1.0)),
      );
    }

    // Sélection de la liste selon Reduce Motion
    final scenes = reduceMotion
        ? splashNarrativeScenesReduced
        : splashNarrativeScenes;
    final scene = scenes[currentIndex];

    // Lancer le controller seulement quand on change de scène.
    if (_lastSceneIndex != currentIndex) {
      _lastSceneIndex = currentIndex;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && !reduceMotion) {
          _startLottieForScene(scene);
        }
      });
    }

    return AnimatedContainer(
      duration: AppDurations.normal,
      decoration: scene.backgroundDecoration,
      child: SafeArea(
        child: Column(
          children: [
            // Petit espace en haut
            const SizedBox(height: AppSpacing.sm),

            // ── Zone illustration Lottie (~60 % de la hauteur utile) ────────
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0.05, 0.0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      ),
                    );
                  },
                  child: SizedBox.expand(
                    key: ValueKey(scene.id),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: SplashLottieIllustration(
                        lottieAsset: scene.lottieAsset,
                        controller: _lottieController,
                        reduceMotion: reduceMotion,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // ── Texte de la scène ────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xxl,
                vertical: AppSpacing.lg,
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                child: Text(
                  scene.title,
                  key: ValueKey('${scene.id}_text'),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ),

            // ── Indicateur de progression (5 dots) ──────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(scenes.length, (index) {
                final isActive = index == currentIndex;
                return AnimatedContainer(
                  duration: AppDurations.fast,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: isActive ? 12 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: isActive
                        ? AppColors.primary
                        : AppColors.primary.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),

            const SizedBox(height: AppSpacing.xxxl),
          ],
        ),
      ),
    );
  }

  Widget _buildShort(BuildContext context) {
    return const ColoredBox(
      color: AppColors.background,
      child: Center(child: SplashLogoReveal(opacity: 1.0, scale: 1.0)),
    );
  }
}

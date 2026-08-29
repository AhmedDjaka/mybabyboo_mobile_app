import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// Widget réutilisable pour afficher une illustration Lottie dans le splash.
///
/// Responsabilités :
/// - Affiche le fichier Lottie via [lottieAsset]
/// - Reçoit l'[AnimationController] géré par le parent
/// - Gère loading / erreur proprement avec logs debug
/// - En mode Reduce Motion ([reduceMotion] == true), affiche une frame statique
///
/// N'instancie ni ne dispose le [controller] — c'est la responsabilité du parent.
class SplashLottieIllustration extends StatelessWidget {
  const SplashLottieIllustration({
    super.key,
    required this.lottieAsset,
    required this.controller,
    this.reduceMotion = false,
  });

  final String lottieAsset;
  final AnimationController controller;
  final bool reduceMotion;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      debugPrint('[SplashLottie] Demande de chargement : $lottieAsset');
    }

    if (reduceMotion) {
      // Mode accessibilité : frame statique (position 0.0)
      return Lottie.asset(
        lottieAsset,
        fit: BoxFit.contain,
        animate: false,
        frameRate: FrameRate.max,
        errorBuilder: _buildError,
      );
    }

    return Lottie.asset(
      lottieAsset,
      controller: controller,
      fit: BoxFit.contain,
      repeat: false,
      frameRate: FrameRate.max,
      onLoaded: (composition) {
        if (kDebugMode) {
          debugPrint(
            '[SplashLottie] Chargé : $lottieAsset '
            '(durée composition : ${composition.duration.inMilliseconds}ms)',
          );
        }
        // Synchroniser la durée du controller avec la composition Lottie.
        controller.duration = composition.duration;
        if (!controller.isAnimating) {
          controller.forward(from: 0.0);
        }
      },
      errorBuilder: _buildError,
    );
  }

  /// Fallback visuel si le fichier Lottie ne peut pas être chargé.
  /// — Debug : zone rouge affichant le chemin + message exact de l'erreur.
  /// — Production : spinner neutre (pas d'icône bébé ambiguë).
  Widget _buildError(
    BuildContext context,
    Object error,
    StackTrace? stackTrace,
  ) {
    debugPrint(
      '[SplashLottie] ERREUR CHARGEMENT\nasset: $lottieAsset\nerror: $error',
    );

    if (kDebugMode) {
      return Container(
        color: Colors.red[900],
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '⚠ LOTTIE LOAD ERROR',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  fontFamily: 'monospace',
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'asset:',
                style: TextStyle(
                  color: Colors.white60,
                  fontFamily: 'monospace',
                  fontSize: 11,
                ),
              ),
              Text(
                lottieAsset,
                style: const TextStyle(
                  color: Colors.yellowAccent,
                  fontFamily: 'monospace',
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'error:',
                style: TextStyle(
                  color: Colors.white60,
                  fontFamily: 'monospace',
                  fontSize: 11,
                ),
              ),
              Text(
                error.toString(),
                style: const TextStyle(
                  color: Colors.orangeAccent,
                  fontFamily: 'monospace',
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Production : loader neutre, pas d'icône bébé ambiguë.
    return const ColoredBox(
      color: Color(0xFF1A1A2E),
      child: Center(child: CircularProgressIndicator(color: Colors.white38)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:baby_mama/features/splash/presentation/pages/splash_page.dart';
import 'package:baby_mama/features/splash/presentation/widgets/splash_lottie_illustration.dart';
import 'package:baby_mama/features/splash/presentation/widgets/splash_logo_reveal.dart';

import 'package:go_router/go_router.dart';

/// Helper : construit un MaterialApp.router autour de SplashPage.
Widget _buildApp({Map<String, Object>? prefs}) {
  SharedPreferences.setMockInitialValues(prefs ?? {});

  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashPage()),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const Scaffold(body: Text('Onboarding')),
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => const Scaffold(body: Text('Auth')),
      ),
    ],
  );

  return ProviderScope(child: MaterialApp.router(routerConfig: router));
}

void main() {
  testWidgets('SplashPage se monte sans erreur', (WidgetTester tester) async {
    await tester.pumpWidget(_buildApp());

    // Frame initiale
    expect(find.byType(SplashPage), findsOneWidget);

    // Drainer tous les timers (bouton Passer + scènes + logo)
    // pour ne laisser aucun timer en attente.
    await tester.pumpAndSettle(const Duration(seconds: 15));
  });

  testWidgets(
    'SplashPage (second launch) affiche le SplashLogoReveal directement',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildApp(
          prefs: {'hasSeenNarrativeSplash': true, 'hasSeenOnboarding': false},
        ),
      );

      // 2 pumps pour laisser le postFrameCallback s'exécuter
      await tester.pump();
      await tester.pump();

      // Le mode court doit afficher SplashLogoReveal
      expect(find.byType(SplashLogoReveal), findsOneWidget);

      // Drainer le timer de 1500 ms (mode court) + navigation
      await tester.pumpAndSettle(const Duration(seconds: 5));
    },
  );

  testWidgets('SplashPage (first launch) affiche un SplashLottieIllustration', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      _buildApp(
        prefs: {'hasSeenNarrativeSplash': false, 'hasSeenOnboarding': false},
      ),
    );

    // Laisser le postFrameCallback + la scène 1 s'afficher
    await tester.pump();
    await tester.pump();

    // En test, Lottie ne peut pas charger les assets réels —
    // SplashLottieIllustration est quand même rendu (avec son fallback).
    expect(find.byType(SplashLottieIllustration), findsOneWidget);

    // Drainer toute la séquence narrative (~ 13 secondes + navigation)
    await tester.pumpAndSettle(const Duration(seconds: 15));
  });
}

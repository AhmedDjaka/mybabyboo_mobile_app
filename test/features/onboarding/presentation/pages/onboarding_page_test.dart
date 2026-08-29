import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:baby_mama/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:go_router/go_router.dart';

void main() {
  testWidgets(
    'OnboardingPage affiche la première slide et permet la navigation',
    (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({});
      final router = GoRouter(
        initialLocation: '/onboarding',
        routes: [
          GoRoute(
            path: '/onboarding',
            builder: (context, state) => const OnboardingPage(),
          ),
          GoRoute(
            path: '/auth',
            builder: (context, state) => const Scaffold(body: Text('AuthPage')),
          ),
        ],
      );

      await tester.pumpWidget(
        ProviderScope(child: MaterialApp.router(routerConfig: router)),
      );

      await tester.pumpAndSettle();

      // Slide 1 visible
      expect(
        find.text('Suivez votre grossesse\nsemaine après semaine.'),
        findsOneWidget,
      );
      expect(find.text('Prenez soin de vous'), findsNothing);

      // Bouton Suivant présent
      expect(find.text('Suivant'), findsOneWidget);
      expect(find.text('Commencer'), findsNothing);

      // Clique sur Suivant
      await tester.tap(find.text('Suivant'));
      await tester.pumpAndSettle();

      // Slide 2 visible
      expect(find.text('Prenez soin de vous'), findsOneWidget);

      // Swipe vers la Slide 3
      await tester.drag(find.byType(PageView), const Offset(-500, 0));
      await tester.pumpAndSettle();

      // Slide 3 visible
      expect(find.text('N\'oubliez rien\nd\'important'), findsOneWidget);

      // Swipe vers la Slide 4
      await tester.drag(find.byType(PageView), const Offset(-500, 0));
      await tester.pumpAndSettle();

      // Slide 4 visible, Bouton Fin présent, Bouton Suivant absent
      expect(find.text('Gardez vos\nsouvenirs précieux'), findsOneWidget);
      expect(find.text('Commencer'), findsOneWidget);
      expect(find.text('Suivant'), findsNothing);

      // Clic sur "Commencer" -> redirige vers auth
      await tester.tap(find.text('Commencer'));
      await tester.pumpAndSettle();

      expect(find.text('AuthPage'), findsOneWidget);
    },
  );
}

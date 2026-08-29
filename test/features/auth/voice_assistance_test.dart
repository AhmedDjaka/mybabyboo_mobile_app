import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:baby_mama/core/accessibility/voice_preferences_provider.dart';
import 'package:baby_mama/shared/widgets/accessibility/voice_assistance_banner.dart';

void main() {
  group('VoicePreferencesProvider', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    test('defaults to false when no preference saved', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // Wait for async load
      await container.read(voicePreferencesProvider.future);
      expect(container.read(voicePreferencesProvider).valueOrNull, isFalse);
    });

    test('setEnabled(true) persists preference', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      await container.read(voicePreferencesProvider.future);
      await container.read(voicePreferencesProvider.notifier).setEnabled(true);

      expect(container.read(voicePreferencesProvider).valueOrNull, isTrue);
    });

    test('setEnabled(false) after true resets to false', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      await container.read(voicePreferencesProvider.future);
      await container.read(voicePreferencesProvider.notifier).setEnabled(true);
      await container.read(voicePreferencesProvider.notifier).setEnabled(false);

      expect(container.read(voicePreferencesProvider).valueOrNull, isFalse);
    });

    test('isVoiceAssistanceEnabledProvider syncs with preference', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      await container.read(voicePreferencesProvider.future);
      await container.read(voicePreferencesProvider.notifier).setEnabled(true);

      expect(container.read(isVoiceAssistanceEnabledProvider), isTrue);
    });
  });

  group('VoiceAssistanceBanner', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    testWidgets('displays voice assistance switch', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(home: Scaffold(body: VoiceAssistanceBanner())),
        ),
      );
      await tester.pump();

      expect(find.byType(Switch), findsOneWidget);
      expect(find.text('Aide vocale'), findsOneWidget);
    });

    testWidgets('switch starts off by default', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(home: Scaffold(body: VoiceAssistanceBanner())),
        ),
      );
      await tester.pumpAndSettle();

      final switchWidget = tester.widget<Switch>(find.byType(Switch));
      expect(switchWidget.value, isFalse);
    });

    testWidgets('tapping switch changes state and does NOT reset', (
      tester,
    ) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(home: Scaffold(body: VoiceAssistanceBanner())),
        ),
      );
      await tester.pumpAndSettle();

      // Tap the switch to enable
      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();

      final switchWidget = tester.widget<Switch>(find.byType(Switch));
      expect(switchWidget.value, isTrue);
    });
  });
}

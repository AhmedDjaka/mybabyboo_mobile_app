// This is a basic Flutter widget test.
// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:baby_mama/app/app.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: MyBabyBooApp()));
    
    // The splash screen contains consecutive Lottie animations. 
    // We pump deterministic durations to allow the animations and the navigation to finish.
    await tester.pump(const Duration(milliseconds: 3000));
    await tester.pump(const Duration(milliseconds: 3500));
    
    // Instead of pumpAndSettle which times out if there are infinite animations
    // (e.g. pulsing icons, lotties, loading indicators), we just pump a few frames
    // to allow the route transition to complete.
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pump(const Duration(milliseconds: 500));
    
    expect(find.byType(MyBabyBooApp), findsOneWidget);
  });
}

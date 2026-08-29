import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:baby_mama/features/auth/presentation/widgets/phone_input_field.dart';

void main() {
  Widget createWidgetUnderTest(
    void Function(String) onChanged, {
    String initialValue = '',
  }) {
    return MaterialApp(
      home: Scaffold(
        body: PhoneInputField(initialValue: initialValue, onChanged: onChanged),
      ),
    );
  }

  testWidgets('PhoneInputField defaults to CI and formats correctly', (
    tester,
  ) async {
    String currentValue = '';
    await tester.pumpWidget(createWidgetUnderTest((v) => currentValue = v));

    expect(find.text('+225'), findsOneWidget); // Dial code CI par défaut

    await tester.enterText(find.byType(TextFormField), '0708091011');
    await tester.pump();

    expect(currentValue, '+2250708091011'); // E.164
  });

  testWidgets('PhoneInputField normalizes spaces and dashes', (tester) async {
    String currentValue = '';
    await tester.pumpWidget(createWidgetUnderTest((v) => currentValue = v));

    await tester.enterText(find.byType(TextFormField), '07 08-09 10 11');
    await tester.pump();

    // Removes spaces/dashes internally
    expect(currentValue, '+2250708091011');
  });

  testWidgets('PhoneInputField switches to Senegal', (tester) async {
    String currentValue = '';
    await tester.pumpWidget(createWidgetUnderTest((v) => currentValue = v));

    // Tap country selector
    await tester.tap(find.text('+225'));
    await tester.pumpAndSettle();

    // Tap Senegal
    await tester.tap(find.text('Sénégal'));
    await tester.pumpAndSettle();

    expect(find.text('+221'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), '771234567');
    await tester.pump();

    expect(currentValue, '+221771234567');
  });

  testWidgets('PhoneInputField loads initial value correctly', (tester) async {
    await tester.pumpWidget(
      createWidgetUnderTest((v) {}, initialValue: '+22670000000'),
    );

    expect(find.text('+226'), findsOneWidget); // Burkina Faso dial code
    expect(find.text('70000000'), findsOneWidget); // Local number
  });
}

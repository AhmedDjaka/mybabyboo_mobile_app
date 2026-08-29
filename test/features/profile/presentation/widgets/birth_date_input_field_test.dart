import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:baby_mama/features/profile/presentation/widgets/birth_date_input_field.dart';

void main() {
  group('BirthDateInputField', () {
    testWidgets(
      'Renders empty fields initially if no initialDate is provided',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BirthDateInputField(onChanged: (date, valid) {}),
            ),
          ),
        );

        expect(find.text('JJ'), findsOneWidget);
        expect(find.text('MM'), findsOneWidget);
        expect(find.text('AAAA'), findsOneWidget);
      },
    );

    testWidgets('Valid date triggers onChanged with valid DateTime', (
      tester,
    ) async {
      DateTime? changedDate;
      bool isValid = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BirthDateInputField(
              onChanged: (date, valid) {
                changedDate = date;
                isValid = valid;
              },
            ),
          ),
        ),
      );

      await tester.enterText(find.widgetWithText(TextField, 'JJ'), '14');
      await tester.enterText(find.widgetWithText(TextField, 'MM'), '06');
      await tester.enterText(find.widgetWithText(TextField, 'AAAA'), '1995');
      await tester.pump();

      expect(isValid, isTrue);
      expect(changedDate, isNotNull);
      expect(changedDate!.year, 1995);
      expect(changedDate!.month, 6);
      expect(changedDate!.day, 14);
      expect(find.text('Complétez votre date de naissance.'), findsNothing);
      expect(find.text('Date invalide.'), findsNothing);
    });

    testWidgets('Invalid date shows error and returns false', (tester) async {
      DateTime? changedDate;
      bool isValid = true;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BirthDateInputField(
              onChanged: (date, valid) {
                changedDate = date;
                isValid = valid;
              },
            ),
          ),
        ),
      );

      await tester.enterText(find.widgetWithText(TextField, 'JJ'), '31');
      await tester.enterText(find.widgetWithText(TextField, 'MM'), '02');
      await tester.enterText(find.widgetWithText(TextField, 'AAAA'), '2000');
      await tester.pump();

      expect(isValid, isFalse);
      expect(changedDate, isNull);
      expect(find.text('Jour invalide.'), findsOneWidget);
    });

    testWidgets('Future date shows error', (tester) async {
      DateTime? changedDate;
      bool isValid = true;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BirthDateInputField(
              onChanged: (date, valid) {
                changedDate = date;
                isValid = valid;
              },
            ),
          ),
        ),
      );

      final nextYear = DateTime.now().year + 1;

      await tester.enterText(find.widgetWithText(TextField, 'JJ'), '01');
      await tester.enterText(find.widgetWithText(TextField, 'MM'), '01');
      await tester.enterText(
        find.widgetWithText(TextField, 'AAAA'),
        nextYear.toString(),
      );
      await tester.pump();

      expect(isValid, isFalse);
      expect(changedDate, isNull);
      expect(
        find.text('La date ne peut pas être dans le futur.'),
        findsOneWidget,
      );
    });

    testWidgets('Leap year 29/02 is valid', (tester) async {
      DateTime? changedDate;
      bool isValid = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BirthDateInputField(
              onChanged: (date, valid) {
                changedDate = date;
                isValid = valid;
              },
            ),
          ),
        ),
      );

      await tester.enterText(find.widgetWithText(TextField, 'JJ'), '29');
      await tester.enterText(find.widgetWithText(TextField, 'MM'), '02');
      await tester.enterText(find.widgetWithText(TextField, 'AAAA'), '2024');
      await tester.pump();

      expect(isValid, isTrue);
      expect(changedDate?.year, 2024);
      expect(find.text('Jour invalide.'), findsNothing);
    });

    testWidgets('Non-leap year 29/02 is invalid', (tester) async {
      bool isValid = true;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BirthDateInputField(
              onChanged: (date, valid) {
                isValid = valid;
              },
            ),
          ),
        ),
      );

      await tester.enterText(find.widgetWithText(TextField, 'JJ'), '29');
      await tester.enterText(find.widgetWithText(TextField, 'MM'), '02');
      await tester.enterText(find.widgetWithText(TextField, 'AAAA'), '2023');
      await tester.pump();

      expect(isValid, isFalse);
      expect(find.text('Jour invalide.'), findsOneWidget);
    });

    testWidgets('Partial date shows soft error', (tester) async {
      bool isValid = true;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BirthDateInputField(
              onChanged: (date, valid) {
                isValid = valid;
              },
            ),
          ),
        ),
      );

      await tester.enterText(find.widgetWithText(TextField, 'JJ'), '14');
      await tester.pump();

      expect(isValid, isFalse);
      expect(find.text('Complétez votre date de naissance.'), findsOneWidget);
    });

    testWidgets('Empty fields return null and valid', (tester) async {
      DateTime? changedDate = DateTime.now();
      bool isValid = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BirthDateInputField(
              onChanged: (date, valid) {
                changedDate = date;
                isValid = valid;
              },
            ),
          ),
        ),
      );

      // Type then delete
      await tester.enterText(find.widgetWithText(TextField, 'JJ'), '1');
      await tester.pump();
      await tester.enterText(find.widgetWithText(TextField, 'JJ'), '');
      await tester.pump();

      expect(isValid, isTrue);
      expect(changedDate, isNull);
      expect(find.text('Complétez votre date de naissance.'), findsNothing);
    });
  });
}

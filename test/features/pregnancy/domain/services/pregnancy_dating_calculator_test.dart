import 'package:flutter_test/flutter_test.dart';
import 'package:baby_mama/features/pregnancy/domain/services/pregnancy_dating_calculator.dart';

void main() {
  group('PregnancyDatingCalculator', () {
    test('calculateDueDateFromLmp calculates correctly (LMP + 280 days)', () {
      final lmp = DateTime(2026, 1, 1);
      final expectedDueDate = DateTime(2026, 10, 8); // 1 Jan + 280 days = 8 Oct

      final result = PregnancyDatingCalculator.calculateDueDateFromLmp(lmp);

      expect(result, expectedDueDate);
    });

    test('calculateDueDateFromLmp handles leap years', () {
      final lmp = DateTime(2024, 2, 29); // Leap year
      final expectedDueDate = DateTime(
        2024,
        12,
        5,
      ); // 29 Feb + 280 days = 5 Dec

      final result = PregnancyDatingCalculator.calculateDueDateFromLmp(lmp);

      expect(result, expectedDueDate);
    });

    test('calculateGestationalAge returns null when dueDate is null', () {
      final result = PregnancyDatingCalculator.calculateGestationalAge(null);
      expect(result, isNull);
    });

    test(
      'calculateGestationalAge calculates total_days, weeks, and days correctly',
      () {
        final dueDate = DateTime(2026, 10, 8); // Reference LMP = 2026-01-01
        final today = DateTime(2026, 1, 15); // 14 days after LMP (2 weeks)

        final result = PregnancyDatingCalculator.calculateGestationalAge(
          dueDate,
          today: today,
        );

        expect(result, isNotNull);
        expect(result!['total_days'], 14);
        expect(result['weeks'], 2);
        expect(result['days'], 0);
      },
    );

    test('calculateGestationalAge clamps negative days to 0', () {
      final dueDate = DateTime(2026, 10, 8); // Reference LMP = 2026-01-01
      final today = DateTime(2025, 12, 25); // Before LMP

      final result = PregnancyDatingCalculator.calculateGestationalAge(
        dueDate,
        today: today,
      );

      expect(result, isNotNull);
      expect(result!['total_days'], 0);
      expect(result['weeks'], 0);
      expect(result['days'], 0);
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:baby_mama/features/pregnancy/domain/entities/pregnancy.dart';
import 'package:baby_mama/features/pregnancy/domain/entities/pregnancy_dating_method.dart';
import 'package:baby_mama/features/pregnancy/domain/entities/gestational_age.dart';

import 'package:baby_mama/features/pregnancy/domain/entities/weekly_pregnancy_content.dart';
import 'package:baby_mama/features/pregnancy/domain/usecases/get_current_pregnancy.dart';
import 'package:baby_mama/features/pregnancy/domain/usecases/get_weekly_pregnancy_content.dart';
import 'package:baby_mama/features/pregnancy/presentation/viewmodels/pregnancy_dashboard_viewmodel.dart';

class MockGetCurrentPregnancy extends Mock implements GetCurrentPregnancy {}

class MockGetWeeklyPregnancyContent extends Mock
    implements GetWeeklyPregnancyContent {}

void main() {
  late MockGetCurrentPregnancy mockGetCurrentPregnancy;
  late MockGetWeeklyPregnancyContent mockGetWeeklyPregnancyContent;
  late PregnancyDashboardViewModel viewModel;

  setUp(() {
    mockGetCurrentPregnancy = MockGetCurrentPregnancy();
    mockGetWeeklyPregnancyContent = MockGetWeeklyPregnancyContent();
  });

  Pregnancy createMockPregnancy({required bool dated, int? weeks}) {
    return Pregnancy(
      id: 1,
      status: 'active',
      datingMethod: dated
          ? PregnancyDatingMethod.professionalDueDate
          : PregnancyDatingMethod.unknown,
      gestationalAge: weeks != null
          ? GestationalAge(weeks: weeks, days: 2, totalDays: weeks * 7 + 2)
          : null,
      pregnancyDated: dated,
    );
  }

  WeeklyPregnancyContent createMockContent(int week) {
    return WeeklyPregnancyContent(
      week: week,
      description: 'Test description for week $week',
    );
  }

  test('initial load with no pregnancy', () async {
    when(() => mockGetCurrentPregnancy.execute()).thenAnswer((_) async => null);

    viewModel = PregnancyDashboardViewModel(
      mockGetCurrentPregnancy,
      mockGetWeeklyPregnancyContent,
    );

    // Give it time to run _init async
    await Future.delayed(Duration.zero);

    expect(viewModel.state.isLoading, false);
    expect(viewModel.state.errorMessage, 'Aucune grossesse active trouvée.');
  });

  test('initial load with unknown pregnancy', () async {
    final pregnancy = createMockPregnancy(dated: false);
    when(
      () => mockGetCurrentPregnancy.execute(),
    ).thenAnswer((_) async => pregnancy);

    viewModel = PregnancyDashboardViewModel(
      mockGetCurrentPregnancy,
      mockGetWeeklyPregnancyContent,
    );

    await Future.delayed(Duration.zero);

    expect(viewModel.state.isLoading, false);
    expect(viewModel.state.currentPregnancy, pregnancy);
    expect(viewModel.state.selectedWeek, null);
    verifyNever(() => mockGetWeeklyPregnancyContent.execute(any()));
  });

  test('initial load with currentWeek < 4', () async {
    final pregnancy = createMockPregnancy(dated: true, weeks: 3);
    when(
      () => mockGetCurrentPregnancy.execute(),
    ).thenAnswer((_) async => pregnancy);

    viewModel = PregnancyDashboardViewModel(
      mockGetCurrentPregnancy,
      mockGetWeeklyPregnancyContent,
    );

    await Future.delayed(Duration.zero);

    expect(viewModel.state.isLoading, false);
    expect(viewModel.state.currentWeek, 3);
    expect(viewModel.state.selectedWeek, null);
    verifyNever(() => mockGetWeeklyPregnancyContent.execute(any()));
  });

  test('initial load with currentWeek 4..40', () async {
    final pregnancy = createMockPregnancy(dated: true, weeks: 10);
    final content = createMockContent(10);

    when(
      () => mockGetCurrentPregnancy.execute(),
    ).thenAnswer((_) async => pregnancy);
    when(
      () => mockGetWeeklyPregnancyContent.execute(10),
    ).thenAnswer((_) async => content);

    viewModel = PregnancyDashboardViewModel(
      mockGetCurrentPregnancy,
      mockGetWeeklyPregnancyContent,
    );

    await Future.delayed(Duration.zero);

    expect(viewModel.state.isLoading, false);
    expect(viewModel.state.currentWeek, 10);
    expect(viewModel.state.selectedWeek, 10);
    expect(viewModel.state.weeklyContent, content);
  });

  test(
    'initial load with currentWeek > 40 clamps selectedWeek to 40',
    () async {
      final pregnancy = createMockPregnancy(dated: true, weeks: 41);
      final content = createMockContent(40);

      when(
        () => mockGetCurrentPregnancy.execute(),
      ).thenAnswer((_) async => pregnancy);
      when(
        () => mockGetWeeklyPregnancyContent.execute(40),
      ).thenAnswer((_) async => content);

      viewModel = PregnancyDashboardViewModel(
        mockGetCurrentPregnancy,
        mockGetWeeklyPregnancyContent,
      );

      await Future.delayed(Duration.zero);

      expect(viewModel.state.isLoading, false);
      expect(viewModel.state.currentWeek, 41);
      expect(viewModel.state.selectedWeek, 40);
      expect(viewModel.state.weeklyContent, content);
    },
  );

  test('goToPreviousWeek navigates correctly', () async {
    final pregnancy = createMockPregnancy(dated: true, weeks: 10);
    final content10 = createMockContent(10);
    final content9 = createMockContent(9);

    when(
      () => mockGetCurrentPregnancy.execute(),
    ).thenAnswer((_) async => pregnancy);
    when(
      () => mockGetWeeklyPregnancyContent.execute(10),
    ).thenAnswer((_) async => content10);
    when(
      () => mockGetWeeklyPregnancyContent.execute(9),
    ).thenAnswer((_) async => content9);

    viewModel = PregnancyDashboardViewModel(
      mockGetCurrentPregnancy,
      mockGetWeeklyPregnancyContent,
    );

    await Future.delayed(Duration.zero);

    expect(viewModel.state.selectedWeek, 10);

    await viewModel.goToPreviousWeek();

    expect(viewModel.state.selectedWeek, 9);
    expect(viewModel.state.weeklyContent, content9);
  });

  test('goToPreviousWeek prevents navigation below week 4', () async {
    final pregnancy = createMockPregnancy(dated: true, weeks: 4);
    final content4 = createMockContent(4);

    when(
      () => mockGetCurrentPregnancy.execute(),
    ).thenAnswer((_) async => pregnancy);
    when(
      () => mockGetWeeklyPregnancyContent.execute(4),
    ).thenAnswer((_) async => content4);

    viewModel = PregnancyDashboardViewModel(
      mockGetCurrentPregnancy,
      mockGetWeeklyPregnancyContent,
    );

    await Future.delayed(Duration.zero);

    expect(viewModel.state.selectedWeek, 4);

    await viewModel.goToPreviousWeek();

    expect(viewModel.state.selectedWeek, 4);
    verifyNever(() => mockGetWeeklyPregnancyContent.execute(3));
  });

  test('goToNextWeek prevents navigation beyond currentWeek', () async {
    final pregnancy = createMockPregnancy(dated: true, weeks: 10);
    final content10 = createMockContent(10);

    when(
      () => mockGetCurrentPregnancy.execute(),
    ).thenAnswer((_) async => pregnancy);
    when(
      () => mockGetWeeklyPregnancyContent.execute(10),
    ).thenAnswer((_) async => content10);

    viewModel = PregnancyDashboardViewModel(
      mockGetCurrentPregnancy,
      mockGetWeeklyPregnancyContent,
    );

    await Future.delayed(Duration.zero);

    expect(viewModel.state.selectedWeek, 10);

    await viewModel.goToNextWeek();

    expect(viewModel.state.selectedWeek, 10);
    verifyNever(() => mockGetWeeklyPregnancyContent.execute(11));
  });

  test(
    'goToNextWeek prevents navigation beyond 40 even if currentWeek > 40',
    () async {
      final pregnancy = createMockPregnancy(dated: true, weeks: 42);
      final content40 = createMockContent(40);

      when(
        () => mockGetCurrentPregnancy.execute(),
      ).thenAnswer((_) async => pregnancy);
      when(
        () => mockGetWeeklyPregnancyContent.execute(40),
      ).thenAnswer((_) async => content40);

      viewModel = PregnancyDashboardViewModel(
        mockGetCurrentPregnancy,
        mockGetWeeklyPregnancyContent,
      );

      await Future.delayed(Duration.zero);

      expect(viewModel.state.selectedWeek, 40);

      await viewModel.goToNextWeek();

      expect(viewModel.state.selectedWeek, 40);
      verifyNever(() => mockGetWeeklyPregnancyContent.execute(41));
    },
  );
}

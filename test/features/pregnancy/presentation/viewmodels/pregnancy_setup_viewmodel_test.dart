import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:baby_mama/features/pregnancy/domain/repositories/pregnancy_repository.dart';
import 'package:baby_mama/features/pregnancy/domain/entities/pregnancy_dating_method.dart';
import 'package:baby_mama/features/pregnancy/domain/entities/pregnancy.dart';
import 'package:baby_mama/features/pregnancy/presentation/viewmodels/pregnancy_setup_viewmodel.dart';
import 'package:baby_mama/features/pregnancy/presentation/providers/pregnancy_providers.dart';

import 'package:baby_mama/features/auth/domain/entities/auth_session.dart';
import 'package:baby_mama/features/auth/presentation/viewmodels/auth_viewmodel.dart';

class MockPregnancyRepository extends Mock implements PregnancyRepository {}

class MockAuthViewModel extends AuthViewModel {
  @override
  AsyncValue<AuthSession?> build() => const AsyncValue.data(null);

  @override
  Future<void> markPregnancyConfigured() async {}

  @override
  Future<void> markProfileCompleted() async {}

  @override
  Future<void> login(String phone, String password) async {}

  @override
  Future<void> logout() async {}
}

void main() {
  late MockPregnancyRepository mockRepo;

  setUp(() {
    mockRepo = MockPregnancyRepository();
  });

  ProviderContainer makeProviderContainer() {
    return ProviderContainer(
      overrides: [
        pregnancyRepositoryProvider.overrideWithValue(mockRepo),
        authViewModelProvider.overrideWith(() => MockAuthViewModel()),
      ],
    );
  }

  group('PregnancySetupViewModel', () {
    test('initial state is correct', () {
      final container = makeProviderContainer();
      final state = container.read(pregnancySetupViewModelProvider);

      expect(state.currentStep, 0);
      expect(state.selectedMethod, isNull);
      expect(state.lmpDate, isNull);
      expect(state.professionalDueDate, isNull);
      expect(state.isLoading, false);
      expect(state.error, isNull);
    });

    test('selectMethod updates state correctly', () {
      final container = makeProviderContainer();
      final notifier = container.read(pregnancySetupViewModelProvider.notifier);

      notifier.selectMethod(PregnancyDatingMethod.lastMenstrualPeriod);
      final state = container.read(pregnancySetupViewModelProvider);

      expect(state.selectedMethod, PregnancyDatingMethod.lastMenstrualPeriod);
    });

    test('nextStep and previousStep work', () {
      final container = makeProviderContainer();
      final notifier = container.read(pregnancySetupViewModelProvider.notifier);

      notifier.nextStep();
      expect(container.read(pregnancySetupViewModelProvider).currentStep, 1);

      notifier.nextStep();
      expect(container.read(pregnancySetupViewModelProvider).currentStep, 2);

      notifier.previousStep();
      expect(container.read(pregnancySetupViewModelProvider).currentStep, 1);

      notifier.previousStep();
      expect(container.read(pregnancySetupViewModelProvider).currentStep, 0);

      notifier.previousStep();
      expect(
        container.read(pregnancySetupViewModelProvider).currentStep,
        0,
      ); // No negative
    });

    test('submitSetup handles unknown successfully', () async {
      final container = makeProviderContainer();
      final notifier = container.read(pregnancySetupViewModelProvider.notifier);

      notifier.selectMethod(PregnancyDatingMethod.unknown);

      when(
        () => mockRepo.setupPregnancy(
          datingMethod: PregnancyDatingMethod.unknown,
        ),
      ).thenAnswer(
        (_) async => const Pregnancy(
          id: 1,
          status: 'active',
          datingMethod: PregnancyDatingMethod.unknown,
          pregnancyDated: false,
        ),
      );

      final success = await notifier.submitSetup();

      expect(success, isTrue);
      final state = container.read(pregnancySetupViewModelProvider);
      expect(state.isLoading, false);
      expect(state.error, isNull);
    });

    test('submitSetup handles 409 error gracefully', () async {
      final container = makeProviderContainer();
      final notifier = container.read(pregnancySetupViewModelProvider.notifier);

      notifier.selectMethod(PregnancyDatingMethod.unknown);

      when(
        () => mockRepo.setupPregnancy(
          datingMethod: PregnancyDatingMethod.unknown,
        ),
      ).thenThrow(Exception('Conflict'));

      final success = await notifier.submitSetup();

      expect(success, isFalse);
      final state = container.read(pregnancySetupViewModelProvider);
      expect(state.isLoading, false);
      expect(
        state.error,
        "Une erreur s'est produite lors de la configuration.",
      );
    });
  });
}

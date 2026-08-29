import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:baby_mama/features/onboarding/presentation/viewmodels/onboarding_viewmodel.dart';
import 'package:baby_mama/features/onboarding/presentation/providers/has_seen_onboarding_provider.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  test('L\'état initial est currentPage: 0, isLastPage: false', () {
    final state = container.read(onboardingViewModelProvider);
    expect(state.currentPage, 0);
    expect(state.isLastPage, false);
  });

  test('onPageChanged met à jour currentPage et isLastPage', () {
    final viewModel = container.read(onboardingViewModelProvider.notifier);

    viewModel.onPageChanged(1);
    expect(container.read(onboardingViewModelProvider).currentPage, 1);
    expect(container.read(onboardingViewModelProvider).isLastPage, false);

    viewModel.onPageChanged(3);
    expect(container.read(onboardingViewModelProvider).currentPage, 3);
    expect(container.read(onboardingViewModelProvider).isLastPage, true);
  });

  test('completeOnboarding sauvegarde hasSeenOnboarding = true', () async {
    final viewModel = container.read(onboardingViewModelProvider.notifier);
    final subPrefs = container.listen(hasSeenOnboardingProvider, (_, _) {});

    await viewModel.completeOnboarding();

    final hasSeen = container.read(hasSeenOnboardingProvider);
    expect(hasSeen, true);

    subPrefs.close();
  });
}

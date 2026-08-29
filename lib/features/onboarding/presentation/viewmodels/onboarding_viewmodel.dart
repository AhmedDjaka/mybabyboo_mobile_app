import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../state/onboarding_state.dart';
import '../providers/has_seen_onboarding_provider.dart';
import 'onboarding_slide_data.dart';

part 'onboarding_viewmodel.g.dart';

@riverpod
class OnboardingViewModel extends _$OnboardingViewModel {
  @override
  OnboardingState build() {
    return const OnboardingState();
  }

  void onPageChanged(int index) {
    state = state.copyWith(
      currentPage: index,
      isLastPage: index == onboardingSlides.length - 1,
    );
  }

  /// Appelé lorsque l'utilisateur veut terminer l'onboarding (Skip ou Fin)
  Future<void> completeOnboarding() async {
    final hasSeenNotifier = ref.read(hasSeenOnboardingProvider.notifier);
    await hasSeenNotifier.setHasSeen(true);
  }
}

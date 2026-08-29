import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/home_providers.dart';
import '../state/home_state.dart';

class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    // We don't fetch immediately in build to allow the UI to control when it fetches
    // or we can just fetch it right away. Usually, we want to fetch right away:
    Future.microtask(() => loadHomeData());
    return const HomeState.initial();
  }

  Future<void> loadHomeData() async {
    state = const HomeState.loading();
    try {
      final repository = ref.read(homeRepositoryProvider);
      final summary = await repository.getHomeSummary();
      state = HomeState.loaded(summary);
    } catch (e) {
      state = HomeState.error(e.toString());
    }
  }

  Future<void> refresh() async {
    // Only difference is we don't necessarily want to show full loading overlay
    // if we already have data, but since we use standard Riverpod state, we can keep the previous state while fetching,
    // or just let Pull-to-refresh handle the UI spinner while state remains 'loaded' in background.
    // Actually, Pull-to-refresh usually expects a Future.
    try {
      final repository = ref.read(homeRepositoryProvider);
      final summary = await repository.getHomeSummary();
      state = HomeState.loaded(summary);
    } catch (e) {
      // Don't change to error state if we already have data, just maybe show a toast.
      // But for simplicity, we can set error state if it's a hard refresh.
      state = HomeState.error(e.toString());
    }
  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_client.dart';
import '../../../auth/presentation/viewmodels/auth_viewmodel.dart';
import '../../data/datasources/pregnancy_remote_datasource.dart';
import '../../data/repositories/pregnancy_repository_impl.dart';
import '../../domain/entities/pregnancy.dart';
import '../../domain/repositories/pregnancy_repository.dart';
import '../../domain/usecases/get_current_pregnancy.dart';
import '../../domain/usecases/get_weekly_pregnancy_content.dart';
import '../state/pregnancy_dashboard_state.dart';
import '../viewmodels/pregnancy_dashboard_viewmodel.dart';
import '../../domain/usecases/get_pregnancy_tips.dart';
import '../viewmodels/pregnancy_tips_viewmodel.dart';
import '../state/pregnancy_tips_state.dart';

final pregnancyRemoteDatasourceProvider = Provider<PregnancyRemoteDatasource>((
  ref,
) {
  final dio = ref.watch(dioClientProvider);
  return PregnancyRemoteDatasource(dio);
});

final pregnancyRepositoryProvider = Provider<PregnancyRepository>((ref) {
  final remoteDatasource = ref.watch(pregnancyRemoteDatasourceProvider);
  return PregnancyRepositoryImpl(remoteDatasource);
});

final currentPregnancyProvider = FutureProvider<Pregnancy?>((ref) async {
  final userState = ref.watch(authViewModelProvider);
  final userId = userState.valueOrNull?.user.id;
  if (userId == null) return null;

  return ref.watch(pregnancyRepositoryProvider).getCurrentPregnancy();
});

final getCurrentPregnancyUseCaseProvider = Provider<GetCurrentPregnancy>((ref) {
  return GetCurrentPregnancy(ref.watch(pregnancyRepositoryProvider));
});

final getWeeklyPregnancyContentUseCaseProvider =
    Provider<GetWeeklyPregnancyContent>((ref) {
      return GetWeeklyPregnancyContent(ref.watch(pregnancyRepositoryProvider));
    });

final getPregnancyTipsUseCaseProvider = Provider<GetPregnancyTips>((ref) {
  return GetPregnancyTips(ref.watch(pregnancyRepositoryProvider));
});

final pregnancyDashboardViewModelProvider =
    StateNotifierProvider<
      PregnancyDashboardViewModel,
      PregnancyDashboardState
    >((ref) {
      final getCurrentPregnancy = ref.watch(getCurrentPregnancyUseCaseProvider);
      final getWeeklyContent = ref.watch(
        getWeeklyPregnancyContentUseCaseProvider,
      );

      // The view model should re-init if the user changes. We can watch auth state if needed,
      // but it's usually recreated when the route changes.
      return PregnancyDashboardViewModel(getCurrentPregnancy, getWeeklyContent);
    });

final pregnancyTipsViewModelProvider =
    StateNotifierProvider<PregnancyTipsViewModel, PregnancyTipsState>((ref) {
      final useCase = ref.watch(getPregnancyTipsUseCaseProvider);
      return PregnancyTipsViewModel(useCase);
    });

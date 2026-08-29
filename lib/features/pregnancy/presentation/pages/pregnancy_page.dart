import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_colors.dart';
import '../providers/pregnancy_providers.dart';
import '../widgets/pregnancy_unknown_state.dart';
import '../widgets/pregnancy_week_header.dart';
import '../widgets/key_takeaways_section.dart';
import '../widgets/pregnancy_header.dart';
import '../widgets/this_week_mini_cards.dart';
import '../widgets/pregnancy_quote_card.dart';
import '../widgets/pregnancy_bookmarks_section.dart';

class PregnancyPage extends ConsumerWidget {
  const PregnancyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pregnancyDashboardViewModelProvider);
    final viewModel = ref.read(pregnancyDashboardViewModelProvider.notifier);

    if (state.isLoading) {
      return const Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      );
    }

    if (state.errorMessage != null) {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 48,
                  color: AppColors.error,
                ),
                const SizedBox(height: 16),
                Text(
                  state.errorMessage!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.primary,
                    fontFamily: 'Quicksand',
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => viewModel.refresh(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Réessayer',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final pregnancy = state.currentPregnancy;

    if (pregnancy == null) {
      return const Scaffold(
        backgroundColor: AppColors.background,
        body: Center(child: Text('Aucune grossesse active.')),
      );
    }

    if (!pregnancy.pregnancyDated) {
      return const Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(child: PregnancyUnknownState()),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.primary,
          onRefresh: () => viewModel.refresh(),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 16)),

              // Header (Ma grossesse + notification + avatar)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: PregnancyHeader(),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 24)),

              // Hero Card (Vue semaine) avec Gesture pour swipe
              if (state.currentWeek != null && state.selectedWeek != null)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: GestureDetector(
                      onHorizontalDragEnd: (details) {
                        final velocity = details.primaryVelocity ?? 0;
                        if (velocity > 300) {
                          // Swipe vers la droite (-> précédent)
                          viewModel.goToPreviousWeek();
                        } else if (velocity < -300) {
                          // Swipe vers la gauche (<- suivant)
                          viewModel.goToNextWeek();
                        }
                      },
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: PregnancyWeekHeader(
                          key: ValueKey(state.selectedWeek),
                          currentPregnancy: pregnancy,
                          selectedWeek: state.selectedWeek!,
                          currentWeek: state.currentWeek!,
                        ),
                      ),
                    ),
                  ),
                ),

              const SliverToBoxAdapter(child: SizedBox(height: 24)),

              if (state.currentWeek != null && state.currentWeek! < 4)
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Center(
                      child: Text(
                        'Le suivi détaillé semaine par semaine commence à partir de la 4ème semaine d\'aménorrhée.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.textSecondary,
                          fontFamily: 'Quicksand',
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                )
              else if (state.isWeekLoading)
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(48.0),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                )
              else if (state.weeklyError != null)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Container(
                      padding: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceSoft,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: AppColors.error.withOpacity(0.3),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: AppColors.error,
                            size: 48,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            state.weeklyError!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: AppColors.error,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              else if (state.weeklyContent == null)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Container(
                      padding: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/illustrations/home/home_baby_boo.png',
                            height: 120,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Le contenu de cette semaine arrive bientôt.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Vous pouvez toujours suivre votre progression ci-dessus.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 14,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              else ...[
                // Section "Cette semaine"
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      'Cette semaine',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 12)),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: ThisWeekMiniCards(
                      sizeCm: state.weeklyContent!.sizeCm,
                      weightG: state.weeklyContent!.weightG,
                      fruitComparison: state.weeklyContent!.fruitComparison,
                      booDescription: state.weeklyContent!.description,
                      momChanges: state.weeklyContent!.momChanges,
                    ),
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 24)),

                // Section À retenir
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: KeyTakeawaysSection(
                      developmentHighlights:
                          state.weeklyContent!.developmentHighlights,
                    ),
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 24)),

                // Carte audio
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: PregnancyQuoteCard(),
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 24)),

                // Mes repères
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: PregnancyBookmarksSection(
                      sizeCm: state.weeklyContent!.sizeCm,
                      weightG: state.weeklyContent!.weightG,
                      fruitComparison: state.weeklyContent!.fruitComparison,
                      booDescription: state.weeklyContent!.description,
                      momChanges: state.weeklyContent!.momChanges,
                    ),
                  ),
                ),
              ],

              SliverSafeArea(
                top: false,
                sliver: SliverToBoxAdapter(
                  child: SizedBox(height: 32),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

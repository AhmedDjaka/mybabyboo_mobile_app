import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_colors.dart';
import '../../domain/entities/pregnancy_tip.dart';
import '../providers/pregnancy_providers.dart';
import '../widgets/pregnancy_tip_card.dart';
import '../widgets/pregnancy_tip_featured_card.dart';

class PregnancyTipsPage extends ConsumerStatefulWidget {
  final int? weekContext;

  const PregnancyTipsPage({super.key, this.weekContext});

  @override
  ConsumerState<PregnancyTipsPage> createState() => _PregnancyTipsPageState();
}

class _PregnancyTipsPageState extends ConsumerState<PregnancyTipsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(pregnancyTipsViewModelProvider.notifier)
          .loadTips(week: widget.weekContext);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(pregnancyTipsViewModelProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: _buildContent(context, state),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, int tipsCount) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,
        bottom: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.textPrimary,
                  size: 20,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Text(
                  'Conseils & astuces',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.only(left: 36.0),
            child: Text(
              'Des repères doux pour vous accompagner au quotidien.',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 15,
                color: AppColors.textSecondary,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Votre bibliothèque s\'enrichit avec votre grossesse 🌸',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$tipsCount conseils disponibles',
                  style: const TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChips(
    BuildContext context,
    PregnancyTipCategory? selectedCategory,
  ) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          _buildChip(context, null, 'Tous', selectedCategory == null),
          _buildChip(
            context,
            PregnancyTipCategory.wellbeing,
            'Bien-être',
            selectedCategory == PregnancyTipCategory.wellbeing,
          ),
          _buildChip(
            context,
            PregnancyTipCategory.nutrition,
            'Alimentation',
            selectedCategory == PregnancyTipCategory.nutrition,
          ),
          _buildChip(
            context,
            PregnancyTipCategory.sleep,
            'Sommeil',
            selectedCategory == PregnancyTipCategory.sleep,
          ),
          _buildChip(
            context,
            PregnancyTipCategory.activity,
            'Activité',
            selectedCategory == PregnancyTipCategory.activity,
          ),
          _buildChip(
            context,
            PregnancyTipCategory.organization,
            'Organisation',
            selectedCategory == PregnancyTipCategory.organization,
          ),
        ],
      ),
    );
  }

  Widget _buildChip(
    BuildContext context,
    PregnancyTipCategory? category,
    String label,
    bool isSelected,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ChoiceChip(
        label: Text(
          label,
          style: TextStyle(
            fontFamily: 'Quicksand',
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
            color: isSelected ? Colors.white : AppColors.textPrimary,
          ),
        ),
        selected: isSelected,
        onSelected: (_) {
          ref
              .read(pregnancyTipsViewModelProvider.notifier)
              .selectCategory(category);
        },
        selectedColor: AppColors.primary,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: isSelected ? Colors.transparent : AppColors.primaryContainer,
          ),
        ),
        showCheckmark: false,
      ),
    );
  }

  Widget _buildContent(BuildContext context, dynamic state) {
    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      );
    }

    if (state.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.error!,
              style: const TextStyle(
                fontFamily: 'Quicksand',
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () =>
                  ref.read(pregnancyTipsViewModelProvider.notifier).loadTips(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
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
      );
    }

    final allTips = List<PregnancyTip>.from(state.allTips);
    if (allTips.isEmpty) {
      return const Center(
        child: Text(
          'De nouveaux conseils arrivent bientôt.',
          style: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 16,
            color: AppColors.textSecondary,
          ),
        ),
      );
    }

    // Séparer featured et autres depuis les tips filtrés
    final tips = List<PregnancyTip>.from(state.tips);
    PregnancyTip? featuredTip;
    final otherTips = <PregnancyTip>[];

    for (final tip in tips) {
      if (tip.isFeatured && featuredTip == null) {
        featuredTip = tip;
      } else {
        otherTips.add(tip);
      }
    }

    PregnancyTip? dailyTip;
    if (state.selectedCategory == null && tips.isNotEmpty) {
      final now = DateTime.now();
      final dayOfYear = int.parse(
        '${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}',
      );
      final sortedTips = List<PregnancyTip>.from(tips)
        ..sort((a, b) => a.id.compareTo(b.id));
      dailyTip = sortedTips[dayOfYear % sortedTips.length];
      if (dailyTip == featuredTip) {
        // Éviter d'afficher le même en featured et daily tip
        dailyTip = sortedTips[(dayOfYear + 1) % sortedTips.length];
      }
    }

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _buildHeader(context, allTips.length),
        ),
        SliverToBoxAdapter(
          child: _buildCategoryChips(context, state.selectedCategory),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              if (featuredTip != null) ...[
                PregnancyTipFeaturedCard(tip: featuredTip),
                const SizedBox(height: 24),
              ],
              if (dailyTip != null) ...[
                _buildDailyTipSection(dailyTip),
                const SizedBox(height: 24),
              ],
              if (otherTips.isEmpty && tips.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.0),
                  child: Center(
                    child: Text(
                      'Aucun conseil pour cette catégorie.',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),
              ...otherTips.map(
                (tip) => Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: PregnancyTipCard(tip: tip, currentWeek: widget.weekContext),
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buildDailyTipSection(PregnancyTip tip) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '🌸 Conseil doux du jour',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        PregnancyTipCard(
          tip: tip,
          currentWeek: widget.weekContext,
          isDailyTip: true,
        ),
      ],
    );
  }
}

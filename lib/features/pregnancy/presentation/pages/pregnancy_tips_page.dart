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
      ref.read(pregnancyTipsViewModelProvider.notifier).loadTips(week: widget.weekContext);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(pregnancyTipsViewModelProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(context),
            _buildCategoryChips(context, state.selectedCategory),
            Expanded(
              child: _buildContent(context, state),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textPrimary, size: 20),
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
        ],
      ),
    );
  }

  Widget _buildCategoryChips(BuildContext context, PregnancyTipCategory? selectedCategory) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          _buildChip(context, null, 'Tous', selectedCategory == null),
          _buildChip(context, PregnancyTipCategory.wellbeing, 'Bien-être', selectedCategory == PregnancyTipCategory.wellbeing),
          _buildChip(context, PregnancyTipCategory.nutrition, 'Alimentation', selectedCategory == PregnancyTipCategory.nutrition),
          _buildChip(context, PregnancyTipCategory.sleep, 'Sommeil', selectedCategory == PregnancyTipCategory.sleep),
          _buildChip(context, PregnancyTipCategory.activity, 'Activité', selectedCategory == PregnancyTipCategory.activity),
          _buildChip(context, PregnancyTipCategory.organization, 'Organisation', selectedCategory == PregnancyTipCategory.organization),
        ],
      ),
    );
  }

  Widget _buildChip(BuildContext context, PregnancyTipCategory? category, String label, bool isSelected) {
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
          ref.read(pregnancyTipsViewModelProvider.notifier).selectCategory(category);
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
              onPressed: () => ref.read(pregnancyTipsViewModelProvider.notifier).loadTips(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Réessayer', style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      );
    }

    final tips = List<PregnancyTip>.from(state.tips);
    if (tips.isEmpty) {
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

    // Séparer featured et autres
    PregnancyTip? featuredTip;
    final otherTips = <PregnancyTip>[];

    for (final tip in tips) {
      if (tip.isFeatured && featuredTip == null) {
        featuredTip = tip;
      } else {
        otherTips.add(tip);
      }
    }

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        if (featuredTip != null) ...[
          PregnancyTipFeaturedCard(tip: featuredTip),
          const SizedBox(height: 24),
        ],
        ...otherTips.map((tip) => Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: PregnancyTipCard(tip: tip),
            )),
      ],
    );
  }
}

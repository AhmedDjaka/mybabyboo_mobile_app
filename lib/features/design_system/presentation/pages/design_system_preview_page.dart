import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_gradients.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../app/theme/app_radius.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../../shared/widgets/app_card.dart';
import '../../../../shared/widgets/app_section_header.dart';
import '../../../../shared/widgets/app_loader.dart';
import '../../../../shared/widgets/app_error_state.dart';
import '../../../../shared/widgets/app_empty_state.dart';

class DesignSystemPreviewPage extends StatelessWidget {
  const DesignSystemPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Design System Preview')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          const AppSectionHeader(title: 'Typographie (Poppins & Quicksand)'),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Display Large (Poppins)',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text(
            'Headline Large (Poppins)',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            'Title Large (Poppins)',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            'Body Large (Quicksand)',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            'Label Large (Quicksand)',
            style: Theme.of(context).textTheme.labelLarge,
          ),

          const Divider(),
          const AppSectionHeader(title: 'Palette de Couleurs'),
          const SizedBox(height: AppSpacing.md),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              _ColorSwatch(color: AppColors.primary, label: 'Primary'),
              _ColorSwatch(
                color: AppColors.primaryContainer,
                label: 'Soft Pink',
              ),
              _ColorSwatch(color: AppColors.secondary, label: 'Plum'),
              _ColorSwatch(color: AppColors.accent, label: 'Warm'),
              _ColorSwatch(color: AppColors.tertiary, label: 'Sage'),
              _ColorSwatch(color: AppColors.success, label: 'Success'),
              _ColorSwatch(color: AppColors.error, label: 'Error'),
            ],
          ),

          const Divider(),
          const AppSectionHeader(title: 'Gradients'),
          const SizedBox(height: AppSpacing.md),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              _GradientSwatch(
                gradient: AppGradients.primaryGradient,
                label: 'Primary',
              ),
              _GradientSwatch(
                gradient: AppGradients.softPinkGradient,
                label: 'Soft Pink',
              ),
              _GradientSwatch(
                gradient: AppGradients.pregnancyGradient,
                label: 'Pregnancy',
              ),
              _GradientSwatch(
                gradient: AppGradients.warmGradient,
                label: 'Warm',
              ),
            ],
          ),

          const Divider(),
          const AppSectionHeader(title: 'Boutons'),
          const SizedBox(height: AppSpacing.md),
          Wrap(
            spacing: AppSpacing.sm,
            children: [
              AppButton(text: 'Primary', onPressed: () {}),
              AppButton(
                text: 'Secondary',
                type: AppButtonType.secondary,
                onPressed: () {},
              ),
              AppButton(
                text: 'Outline',
                type: AppButtonType.outline,
                onPressed: () {},
              ),
              AppButton(
                text: 'Text',
                type: AppButtonType.text,
                onPressed: () {},
              ),
              AppButton(text: 'Loading', isLoading: true, onPressed: () {}),
              AppButton(text: 'Disabled', isDisabled: true, onPressed: () {}),
            ],
          ),

          const Divider(),
          const AppSectionHeader(title: 'Inputs'),
          const SizedBox(height: AppSpacing.md),
          const AppTextField(hintText: 'Hint text', labelText: 'Label text'),
          const SizedBox(height: AppSpacing.md),
          const AppTextField(
            hintText: 'With Icon',
            prefixIcon: Icon(Icons.search),
          ),
          const SizedBox(height: AppSpacing.md),
          const AppTextField(
            hintText: 'Error state',
            errorText: 'Invalid input',
          ),

          const Divider(),
          const AppSectionHeader(title: 'Cards'),
          const SizedBox(height: AppSpacing.md),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Titre de la carte',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Contenu de la carte avec une ombre très douce.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),

          const Divider(),
          const AppSectionHeader(title: 'États (Loader, Empty, Error)'),
          const SizedBox(height: AppSpacing.md),
          const AppLoader(),
          const AppEmptyState(
            message: 'Aucune donnée pour le moment',
            icon: Icons.inbox_outlined,
          ),
          AppErrorState(message: 'Une erreur est survenue', onRetry: () {}),
        ],
      ),
    );
  }
}

class _ColorSwatch extends StatelessWidget {
  const _ColorSwatch({required this.color, required this.label});
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: AppRadius.smallRadius,
            border: Border.all(color: AppColors.borderSoft),
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(label, style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}

class _GradientSwatch extends StatelessWidget {
  const _GradientSwatch({required this.gradient, required this.label});
  final Gradient gradient;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 50,
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: AppRadius.smallRadius,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(label, style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}

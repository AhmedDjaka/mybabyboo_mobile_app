import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../shared/widgets/accessibility/voice_help_button.dart';

class BooGrowsSection extends StatelessWidget {
  final double? sizeCm;
  final int? weightG;
  final String? fruitComparison;
  final String? description;

  const BooGrowsSection({
    super.key,
    this.sizeCm,
    this.weightG,
    this.fruitComparison,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    if (description == null || description!.isEmpty) {
      return const SizedBox.shrink();
    }

    final hasSize = sizeCm != null && sizeCm! > 0;
    final hasWeight = weightG != null && weightG! > 0;
    final hasFruit = fruitComparison != null && fruitComparison!.isNotEmpty;

    final hasMetrics = hasSize || hasWeight || hasFruit;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Boo grandit',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                  fontFamily: 'Poppins',
                ),
              ),
              VoiceHelpButton(textToRead: description!),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: SizedBox(
              height: 120,
              child: Image.asset(
                'assets/illustrations/home/home_baby_boo.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 20),
          if (hasMetrics) ...[
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (hasSize)
                  _buildMetricChip(
                    'Taille',
                    '${sizeCm.toString().replaceAll('.', ',')} cm',
                  ),
                if (hasWeight) _buildMetricChip('Poids', '$weightG g'),
                if (hasFruit) _buildMetricChip('Comme', fruitComparison!),
              ],
            ),
            const SizedBox(height: 16),
          ],
          Text(
            description!,
            style: const TextStyle(
              fontSize: 15,
              color: AppColors.textSecondary,
              fontFamily: 'Quicksand',
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricChip(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 13,
            fontFamily: 'Quicksand',
            color: AppColors.textPrimary,
          ),
          children: [
            TextSpan(
              text: '$label : ',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(
                color: AppColors.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

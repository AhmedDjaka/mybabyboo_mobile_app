import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../shared/widgets/accessibility/voice_help_button.dart';

class BooBottomSheet extends StatelessWidget {
  final double? sizeCm;
  final int? weightG;
  final String? fruitComparison;
  final String? description;

  const BooBottomSheet({
    super.key,
    this.sizeCm,
    this.weightG,
    this.fruitComparison,
    this.description,
  });

  static void show(
    BuildContext context, {
    double? sizeCm,
    int? weightG,
    String? fruitComparison,
    String? description,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: AppColors.surfaceSoft,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      builder: (context) => BooBottomSheet(
        sizeCm: sizeCm,
        weightG: weightG,
        fruitComparison: fruitComparison,
        description: description,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (description == null || description!.isEmpty) {
      return const SizedBox.shrink();
    }

    final hasSize = sizeCm != null && sizeCm! > 0;
    final hasWeight = weightG != null && weightG! > 0;
    final hasFruit = fruitComparison != null && fruitComparison!.isNotEmpty;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            top: 12.0,
            bottom: 32.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: AppColors.disabled,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      'Boo grandit',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  VoiceHelpButton(textToRead: description!),
                ],
              ),
              const SizedBox(height: 24),
              Center(
                child: SizedBox(
                  height: 160,
                  child: Image.asset(
                    'assets/illustrations/home/home_baby_boo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              if (hasSize || hasWeight || hasFruit) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (hasSize)
                      _buildMetricChip(
                        'Taille',
                        '${sizeCm.toString().replaceAll('.', ',')} cm',
                      ),
                    if (hasSize && hasWeight) const SizedBox(width: 8),
                    if (hasWeight) _buildMetricChip('Poids', '$weightG g'),
                    if ((hasSize || hasWeight) && hasFruit)
                      const SizedBox(width: 8),
                    if (hasFruit)
                      _buildMetricChip('Comparaison', fruitComparison!),
                  ],
                ),
                const SizedBox(height: 24),
              ],
              Flexible(
                child: SingleChildScrollView(
                  child: Text(
                    description!,
                    style: const TextStyle(
                      fontSize: 15,
                      color: AppColors.textSecondary,
                      fontFamily: 'Quicksand',
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetricChip(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Quicksand',
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.primaryContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ],
    );
  }
}

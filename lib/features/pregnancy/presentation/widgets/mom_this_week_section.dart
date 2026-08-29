import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../shared/widgets/accessibility/voice_help_button.dart';

class MomThisWeekSection extends StatelessWidget {
  final String? momChanges;

  const MomThisWeekSection({super.key, this.momChanges});

  @override
  Widget build(BuildContext context) {
    if (momChanges == null || momChanges!.isEmpty) {
      return const SizedBox.shrink();
    }

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
                'Maman cette semaine',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                  fontFamily: 'Poppins',
                ),
              ),
              VoiceHelpButton(textToRead: momChanges!),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: SizedBox(
              height: 120,
              child: Image.asset(
                'assets/illustrations/home/home_pregnant_woman.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            momChanges!,
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
}

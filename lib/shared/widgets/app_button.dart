import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';

enum AppButtonType { primary, secondary, outline, text }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = AppButtonType.primary,
    this.isLoading = false,
    this.isDisabled = false,
  });

  final String text;
  final VoidCallback onPressed;
  final AppButtonType type;
  final bool isLoading;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    final bool isActuallyDisabled = isDisabled || isLoading;

    switch (type) {
      case AppButtonType.primary:
        return ElevatedButton(
          onPressed: isActuallyDisabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.surface,
          ),
          child: _buildChild(),
        );
      case AppButtonType.secondary:
        return ElevatedButton(
          onPressed: isActuallyDisabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.secondary,
            foregroundColor: AppColors.surface,
          ),
          child: _buildChild(),
        );
      case AppButtonType.outline:
        return OutlinedButton(
          onPressed: isActuallyDisabled ? null : onPressed,
          child: _buildChild(),
        );
      case AppButtonType.text:
        return TextButton(
          onPressed: isActuallyDisabled ? null : onPressed,
          child: _buildChild(),
        );
    }
  }

  Widget _buildChild() {
    if (isLoading) {
      return const SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
        ),
      );
    }
    return Text(text);
  }
}

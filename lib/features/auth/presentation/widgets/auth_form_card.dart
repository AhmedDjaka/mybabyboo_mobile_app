import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';

/// Carte blanche arrondie pour contenir les formulaires d'authentification.
class AuthFormCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;

  const AuthFormCard({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 24,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.fromLTRB(28, 32, 28, 32),
        child: child,
      ),
    );
  }
}

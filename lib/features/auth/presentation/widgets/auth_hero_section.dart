import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../app/theme/app_colors.dart';

/// Widget Hero réutilisable pour les écrans d'authentification.
/// Intègre l'illustration auth_hero_mom.png dans une composition élégante.
class AuthHeroSection extends StatelessWidget {
  final String? tagline;
  final bool showBackButton;

  const AuthHeroSection({super.key, this.tagline, this.showBackButton = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Illustration principale en cover
        Positioned.fill(
          child: Image.asset(
            'assets/illustrations/auth/auth_hero_mom.png',
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            errorBuilder: (_, _, _) => const SizedBox.shrink(),
          ),
        ),
        // Contenu par-dessus
        SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showBackButton)
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.textPrimary,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                if (!showBackButton) const SizedBox(height: 20),

                // Logo / marque
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.favorite_rounded,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'MyBabyBoo',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.secondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Accroche
                if (tagline != null)
                  SizedBox(
                    width: 220,
                    child: Text(
                      tagline!,
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                        height: 1.25,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PregnancyNotDatedCard extends StatelessWidget {
  const PregnancyNotDatedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF6F8),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFFAD6E1), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Votre espace grossesse est prêt. 🌸',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
              color: Color(0xFF4A3043),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Ajoutez votre date prévue d\'accouchement pour suivre l\'évolution de Boo semaine après semaine.',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Quicksand',
              color: Color(0xFF806A78),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Navigue vers l'édition ciblée ou le setup pour compléter la date
              context.push('/pregnancy-edit');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF08EA2),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: const Text(
              'Ajouter ma date',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

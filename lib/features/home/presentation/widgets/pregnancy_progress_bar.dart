import 'package:flutter/material.dart';

class PregnancyProgressBar extends StatelessWidget {
  final int progressPercentage;

  const PregnancyProgressBar({super.key, required this.progressPercentage});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 8,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFFAD6E1).withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              FractionallySizedBox(
                widthFactor: (progressPercentage / 100).clamp(0.0, 1.0),
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF08EA2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Text(
          '$progressPercentage%',
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: Color(0xFF8B5D7A),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../domain/entities/home_summary.dart';

class BabyThisWeekCard extends StatefulWidget {
  final HomeBabyThisWeek? babyContent;

  const BabyThisWeekCard({super.key, this.babyContent});

  @override
  State<BabyThisWeekCard> createState() => _BabyThisWeekCardState();
}

class _BabyThisWeekCardState extends State<BabyThisWeekCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final title = widget.babyContent?.title ?? 'Boo cette semaine 💕';
    final summary =
        widget.babyContent?.summary ??
        'Le contenu de votre semaine arrive bientôt.';

    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: AnimatedSize(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        alignment: Alignment.topCenter,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF6F8), // matches hero card
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF8B5D7A).withValues(alpha: 0.04),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Illustration on the left
              Image.asset(
                'assets/illustrations/home/home_baby_boo.png',
                width: 70,
                height: 70,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 16),
              // Center content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        color: Color(0xFF4A3043),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      summary,
                      style: const TextStyle(
                        fontSize: 13,
                        fontFamily: 'Quicksand',
                        color: Color(0xFF806A78),
                        height: 1.4,
                      ),
                      maxLines: _isExpanded ? null : 2,
                      overflow: _isExpanded ? null : TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // Right chevron
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xFFF08EA2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: AnimatedRotation(
                    turns: _isExpanded ? 0.25 : 0.0,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    child: const Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.white,
                      size: 24,
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
}

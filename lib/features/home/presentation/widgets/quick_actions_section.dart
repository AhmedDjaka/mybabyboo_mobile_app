import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_assets.dart';

/// Descriptor for a quick-action icon using SVG asset.
class _ActionIcon {
  const _ActionIcon.svg(this.svgAsset);

  final String svgAsset;

  Widget build({required Color color, required double size}) {
    return SvgPicture.asset(
      svgAsset,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Mes raccourcis',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
            color: Color(0xFF4A3043),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: const [
            Expanded(
              child: _QuickActionCard(
                title: 'Agenda',
                iconDesc: _ActionIcon.svg(AppAssets.quickActionAgenda),
                isAvailable: true,
                route: '/agenda',
                baseColor: Color(0xFFF08EA2),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: _QuickActionCard(
                title: 'Journal',
                iconDesc: _ActionIcon.svg(AppAssets.quickActionJournal),
                isAvailable: false,
                baseColor: Color(0xFFF08EA2),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: _QuickActionCard(
                title: 'Bien-être',
                iconDesc: _ActionIcon.svg(AppAssets.quickActionWellbeing),
                isAvailable: false,
                // baseColor: Color(0xFFA9C6B0),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: _QuickActionCard(
                title: 'Voice Life',
                iconDesc: _ActionIcon.svg(AppAssets.quickActionVoiceLife),
                isAvailable: false,
                baseColor: Color(0xFFF08EA2),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final String title;
  final _ActionIcon iconDesc;
  final bool isAvailable;
  final String? route;
  final Color baseColor;

  const _QuickActionCard({
    required this.title,
    required this.iconDesc,
    this.isAvailable = false,
    this.route,
    this.baseColor = const Color(0xFFF08EA2),
  });

  void _showUnavailable(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Bientôt disponible'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmall = constraints.maxWidth < 70;
        final iconColor = isAvailable
            ? baseColor
            : baseColor.withValues(alpha: 0.6);
        final labelColor = isAvailable
            ? const Color(0xFF4A3043)
            : const Color(0xFF4A3043).withValues(alpha: 0.7);

        return Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(
                  255,
                  142,
                  240,
                  181,
                ).withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(color: const Color(0xFFFEEBF1), width: 1),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                if (isAvailable && route != null) {
                  // context.push(route!);
                } else {
                  _showUnavailable(context);
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconDesc.build(color: iconColor, size: isSmall ? 24 : 28),
                  const SizedBox(height: 6),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: isSmall ? 10 : 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Quicksand',
                      color: labelColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Custom icon widget wrapping SVG assets for branding fidelity.
/// Falls back to a Material [IconData] if the SVG path is null.
class BrandIcon extends StatelessWidget {
  const BrandIcon.svg({
    super.key,
    required this.assetPath,
    this.size = 28,
    this.color,
  }) : icon = null;

  const BrandIcon.material({
    super.key,
    required IconData iconData,
    this.size = 28,
    this.color,
  }) : icon = iconData,
       assetPath = null;

  final String? assetPath;
  final IconData? icon;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (assetPath != null) {
      return SvgPicture.asset(
        assetPath!,
        width: size,
        height: size,
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null,
      );
    }
    return Icon(icon, size: size, color: color);
  }
}

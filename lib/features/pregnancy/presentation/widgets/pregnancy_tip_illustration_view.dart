import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/pregnancy_tip.dart';
import 'pregnancy_tip_ui_helpers.dart';

class PregnancyTipIllustrationView extends StatelessWidget {
  final String? imageUrl;
  final String category;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final String? altText;

  const PregnancyTipIllustrationView({
    super.key,
    required this.imageUrl,
    required this.category,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.altText,
  });

  @override
  Widget build(BuildContext context) {
    final semanticLabel = altText ?? 'Illustration pour la catégorie $category';

    Widget child;

    if (imageUrl != null && imageUrl!.isNotEmpty) {
      child = CachedNetworkImage(
        imageUrl: imageUrl!,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) => _buildPlaceholder(),
        errorWidget: (context, url, error) => _buildFallback(),
      );
    } else {
      child = _buildFallback();
    }

    if (borderRadius != null) {
      child = ClipRRect(borderRadius: borderRadius!, child: child);
    }

    return Semantics(label: semanticLabel, image: true, child: child);
  }

  Widget _buildPlaceholder() {
    return Container(
      width: width,
      height: height,
      color: const Color(0xFFFDE8E9), // Soft Pink fallback from master branding
      child: const Center(
        child: CircularProgressIndicator(
          color: Color(0xFFE5B5B8), // Muted pink
          strokeWidth: 2,
        ),
      ),
    );
  }

  Widget _buildFallback() {
    // Fallback to local image asset
    final enumCategory = PregnancyTipCategory.values.firstWhere(
      (e) => e.name == category,
      orElse: () => PregnancyTipCategory.unknown,
    );
    final localPath = PregnancyTipUiHelpers.getImagePathForCategory(
      enumCategory,
    );
    if (localPath != null) {
      return Image.asset(localPath, width: width, height: height, fit: fit);
    }
    return _buildPlaceholder();
  }
}

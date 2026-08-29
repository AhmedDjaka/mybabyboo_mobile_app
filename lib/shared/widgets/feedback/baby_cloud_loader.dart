import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BabyCloudLoader extends StatelessWidget {
  final double width;
  final double height;
  final bool animate;

  const BabyCloudLoader({
    super.key,
    this.width = 120,
    this.height = 120,
    this.animate = true,
  });

  @override
  Widget build(BuildContext context) {
    final bool shouldAnimate =
        animate && !MediaQuery.of(context).disableAnimations;

    return Center(
      child: Lottie.asset(
        'assets/animations/common/baby_cloud_loader.json',
        width: width,
        height: height,
        animate: shouldAnimate,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          // Fallback if the asset is missing
          return const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.pinkAccent),
          );
        },
      ),
    );
  }
}

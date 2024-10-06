import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BuildShimmer extends StatelessWidget {
  final double? height;
  final double? width;

  const BuildShimmer({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    // Determine colors based on the theme
    Color baseColor;
    Color highlightColor;
    Color containerColor;

    if (Theme.of(context).brightness == Brightness.dark) {
      baseColor = Colors.grey.shade800;
      highlightColor = Colors.grey.shade700;
      containerColor = Colors.grey.shade900;
    } else {
      baseColor = Colors.grey.shade300;
      highlightColor = Colors.grey.shade100;
      containerColor = Colors.white;
    }

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: containerColor,
        ),
      ),
    );
  }
}

class BuildErrorWidget extends StatelessWidget {
  final double? height;
  final double? width;

  const BuildErrorWidget({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    Color containerColor;

    if (Theme.of(context).brightness == Brightness.dark) {
      containerColor = Colors.red.shade700;
    } else {
      containerColor = Colors.red.shade200;
    }

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: containerColor,
      ),
      child: const Center(
        child: Icon(
          Icons.error,
          color: Colors.white,
        ),
      ),
    );
  }
}

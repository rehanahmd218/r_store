import 'package:flutter/material.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/helpers/helper_functions.dart';
import 'package:shimmer/shimmer.dart';

class RShimmerEffect extends StatelessWidget {
  const RShimmerEffect({super.key , required this.width, required this.height, this.radius = 15,this.color});
  final double width;
  final double height;
  final double radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);

    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (isDark ? RColors.darkGrey : RColors.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}

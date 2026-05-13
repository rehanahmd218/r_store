import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:r_store/common/widgets/loaders/shimmer.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/helpers/helper_functions.dart';

class RCircularImage extends StatelessWidget {
  final double? width, height;
  final String imgUrl;
  final Color? overlayColor;
  final Color? bgColor;
  final bool applyImgRadius;
  final BoxBorder? border;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final double borderRadius;
  final bool isNetworkImg;

  const RCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    required this.imgUrl,
    this.overlayColor,
    this.bgColor = RColors.backgroundLight,
    this.applyImgRadius = true,
    this.border,
    this.fit = BoxFit.cover,
    this.padding,
    this.onPressed,
    this.borderRadius = RSizes.md,
    this.isNetworkImg = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: applyImgRadius
            ? BorderRadius.circular(100)
            : BorderRadius.zero,
        child: imgUrl.startsWith('http')
            ? CachedNetworkImage(
                imageUrl: imgUrl,
                fit: fit,
                color: overlayColor,
                progressIndicatorBuilder: (context, url, progress) =>
                    RShimmerEffect(width: 70, height: 70),
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  color: RColors.error,
                  size: RSizes.iconLg,
                ),
              )
            : Image.asset(imgUrl, fit: fit),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:r_store/common/widgets/loaders/shimmer.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/sizes.dart';

class RRoundedImage extends StatelessWidget {
  final double? width, height;
  final String imgUrl;
  final bool applyImgRadius;
  final BoxBorder? border;
  final Color bgColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final double borderRadius;
  final bool? isNetworkImg;

  const RRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imgUrl,
    this.applyImgRadius = true,
    this.border,
    this.bgColor = RColors.white,
    this.fit = BoxFit.contain,
    this.padding,
    this.onPressed,
    this.borderRadius = RSizes.md,
    this.isNetworkImg = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding:
            padding ??
            const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(
            applyImgRadius ? borderRadius : 0,
          ),
          border: border,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            applyImgRadius ? borderRadius : 0,
          ),
          child: imgUrl.startsWith('http')
              ? CachedNetworkImage(
                imageUrl: imgUrl,
                  fit: fit,
                  progressIndicatorBuilder: (context, url, progress) =>
                      RShimmerEffect(
                          width: width ?? 200, height: height ?? 180),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )
              : Image(image: AssetImage(imgUrl),fit: fit,),
        ),
      ),
    );
  }
}

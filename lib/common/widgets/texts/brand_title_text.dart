import 'package:flutter/material.dart';
import 'package:r_store/utils/constants/enums.dart';

class RBrandTitleText extends StatelessWidget {

  final Color? color;
  final String title;
  final int maxLines;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;
  const RBrandTitleText({super.key, this.color, this.maxLines = 1, required this.title, this.textAlign = TextAlign.center, this.brandTextSize = TextSizes.small});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: brandTextSize == TextSizes.small
          ? Theme.of(context).textTheme.titleSmall!.apply(color: color)
          : brandTextSize == TextSizes.medium
              ? Theme.of(context).textTheme.titleMedium!.apply(color: color)
              : Theme.of(context).textTheme.titleLarge!.apply(color: color),
    );
  }
}
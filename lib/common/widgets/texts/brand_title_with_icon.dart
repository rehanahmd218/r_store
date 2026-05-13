import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/common/widgets/texts/brand_title_text.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/enums.dart';
import 'package:r_store/utils/constants/sizes.dart';

class RBrandTitleWithIcon extends StatelessWidget {

  final String title;
  final int mnaxLines;
  final Color? textColor,iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  const RBrandTitleWithIcon({
    super.key,
    this.textColor,
    this.mnaxLines=1,
    required this.title,
    this.iconColor = RColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [

        Flexible(child: RBrandTitleText(
          color: textColor,
          title: title,
          textAlign: textAlign,
          brandTextSize: brandTextSize,
        )),
        const SizedBox(width: RSizes.xs),
                 Icon(
          Iconsax.verify5,
          color: iconColor,
          size: RSizes.iconXs,
        ),
      ],
    );
  }
}
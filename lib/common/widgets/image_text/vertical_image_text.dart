import 'package:flutter/material.dart';
import 'package:r_store/common/widgets/images/circular_image.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/image_strings.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/helpers/helper_functions.dart';

class RVerticalImageText extends StatelessWidget {
  final String image, title;
  final Color textColor;
  final Color? bgColor;
  final void Function()? onTap;

  const RVerticalImageText({
    super.key,
    this.image = '',
    this.title = 'Category',
    this.textColor = RColors.textWhite,
    this.bgColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: RSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                color: RColors.backgroundLight,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: RCircularImage(imgUrl: image.isNotEmpty
                    ? image
                    : RImages.darkAppLogo,
                    isNetworkImg: image.startsWith('http'),
                    fit: BoxFit.cover,
                    padding: const EdgeInsets.all(12),
                    ),
              ),
            ),
            const SizedBox(height: RSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.apply(color: RColors.textWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

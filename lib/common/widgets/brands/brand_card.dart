import 'package:flutter/material.dart';
import 'package:r_store/common/widgets/custome_shapes/containers/rounded_container.dart';
import 'package:r_store/common/widgets/images/circular_image.dart';
import 'package:r_store/common/widgets/texts/brand_title_with_icon.dart';
import 'package:r_store/features/shop/models/brand_model.dart';
import 'package:r_store/utils/constants/enums.dart';
import 'package:r_store/utils/constants/image_strings.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/constants/colors.dart';
class RBrandCard extends StatelessWidget {
  const RBrandCard({
    super.key,
    required this.showBorder,
    required this.onTap,
    required this.brand,
  });
  final bool showBorder;
  final void Function()? onTap;
  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RRoundedContainer(
        padding: const EdgeInsets.all(RSizes.sm),
        showBorder: showBorder,
        bgColor: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RCircularImage(
              bgColor: isDark ? RColors.darkSurface : RColors.grey,
              fit: BoxFit.contain,
              imgUrl: brand.image,
              padding: EdgeInsets.all(4),
              width: 40,
              height: 40,
            ),
            const SizedBox(
              width: RSizes.spaceBtwItems / 2,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RBrandTitleWithIcon(
                    title: brand.name,
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '${brand.productsCount} Products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
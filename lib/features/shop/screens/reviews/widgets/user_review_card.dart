import 'package:flutter/material.dart';
import 'package:r_store/common/widgets/custome_shapes/containers/rounded_container.dart';
import 'package:r_store/features/shop/screens/reviews/widgets/rating_bar_stars.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class RUserReviewCard extends StatelessWidget {
  const RUserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: isDark ? RColors.darkImageBg : null,
                ),
                const SizedBox(width: RSizes.sm),
                Text('Rehan', style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            const Spacer(),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(width: RSizes.spaceBtwItems),

        Row(
          children: [
            RRatingStarsIndicator(rating: 4.9, itemSize: 16),
            const SizedBox(width: RSizes.sm),
            Text('20-8-2025', style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
        ReadMoreText(
          'This is a sample review text that is quite long and needs to be trimmed for display purposes and this does not fit in the available space.',
          trimLines: 2,
          trimCollapsedText: ' Show more',
          trimExpandedText: ' Show less',
          style: Theme.of(context).textTheme.bodySmall,
          trimMode: TrimMode.Line,
          moreStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          lessStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
              const SizedBox(height: RSizes.spaceBtwItems),

        RRoundedContainer(
          padding: EdgeInsets.all(RSizes.defaultSpace),
          bgColor: isDark ? RColors.darkSurface : RColors.grey,
          showBorder: isDark,
          borderColor: RColors.darkCardBorder,

          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'R\'Store',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    '20-08-2025',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              const SizedBox(height: RSizes.spaceBtwItems),
              ReadMoreText(
                'This is a sample review text that is quite long and needs to be trimmed for display purposes and this does not fit in the available space.',
                trimLines: 2,
                trimCollapsedText: ' Show more',
                trimExpandedText: ' Show less',
                style: Theme.of(context).textTheme.bodySmall,
                trimMode: TrimMode.Line,
                moreStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
                lessStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: RSizes.spaceBtwSections,),
      ],
    );
    
  }
}
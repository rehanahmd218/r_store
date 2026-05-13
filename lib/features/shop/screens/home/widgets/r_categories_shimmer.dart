import 'package:flutter/material.dart';
import 'package:r_store/common/widgets/loaders/shimmer.dart';
import 'package:r_store/utils/constants/sizes.dart';

class RCategoriesShimmer extends StatelessWidget {
  const RCategoriesShimmer({super.key});
  final int itemCount = 6;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RShimmerEffect(width: 55, height: 55, radius: 55),
                const SizedBox(height: RSizes.spaceBtwItems / 2),
                RShimmerEffect(width: 55, height: 8, radius: 4),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: RSizes.spaceBtwItems);
        },
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        shrinkWrap: true,
      ),
    );
  }
}

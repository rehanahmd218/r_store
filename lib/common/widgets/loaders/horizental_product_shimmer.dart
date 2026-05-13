import 'package:flutter/material.dart';
import 'package:r_store/common/widgets/layout/grid_layout.dart';
import 'package:r_store/common/widgets/loaders/shimmer.dart';
import 'package:r_store/utils/constants/sizes.dart';

class RProductCardHorizentalShimmer extends StatelessWidget {
  const RProductCardHorizentalShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: RSizes.spaceBtwItems,
      ),
      itemCount: itemCount,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return SizedBox(
          width: 310,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RShimmerEffect(width: 120, height: 140),
              // SizedBox(height: RSizes.spaceBtwItems),
              RShimmerEffect(width: 190, height: 140),
              
              // RShimmerEffect(width: , height: 15),
            ],
          ),
        );
      },
    );
  }
}

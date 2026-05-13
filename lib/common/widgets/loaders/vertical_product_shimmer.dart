import 'package:flutter/material.dart';
import 'package:r_store/common/widgets/layout/grid_layout.dart';
import 'package:r_store/common/widgets/loaders/shimmer.dart';
import 'package:r_store/utils/constants/sizes.dart';

class RProductCardVerticalShimmer extends StatelessWidget {
  const RProductCardVerticalShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return RGridLayout(itemCount: itemCount, itemBuilder: (_,index){


      return SizedBox(
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RShimmerEffect(width: 170, height: 170),
            SizedBox(height: RSizes.spaceBtwItems),
            RShimmerEffect(width: 150, height: 15),
            SizedBox(height: RSizes.spaceBtwItems/2),
            RShimmerEffect(width: 100, height: 15),
          ],
        ),
      );
    });
  }
}
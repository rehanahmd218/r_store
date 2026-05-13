import 'package:flutter/material.dart';
import 'package:r_store/common/widgets/layout/grid_layout.dart';
import 'package:r_store/common/widgets/loaders/shimmer.dart';

class RBrandsShimmer extends StatelessWidget {
  const RBrandsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return RGridLayout(
      itemCount: 4,
      itemBuilder: (_, index) {
        return RShimmerEffect(width: 300, height: 300);
      },
    );
  }
}

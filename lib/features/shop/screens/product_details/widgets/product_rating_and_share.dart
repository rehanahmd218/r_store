import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/sizes.dart';

class RProductRatingAndShare extends StatelessWidget {
  const RProductRatingAndShare({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Iconsax.star5, color: Colors.amber),
        const SizedBox(width: RSizes.sm),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '4.5',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextSpan(
                text: ' (199)',
                style: Theme.of(context).textTheme.bodySmall,
              ),

              // TextSpan(text: ' (100+ Reviews)',style: TextStyle(fontSize: RSizes.sm,color: isDark?RColors.white70:RColors.black54))
            ],
          ),
        ),
        Spacer(),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Iconsax.share, size: RSizes.lg),
              color: isDark ? RColors.white : RColors.black,
            ),
          ],
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:r_store/common/prefferd_sized/appbar.dart';
import 'package:r_store/features/shop/screens/reviews/widgets/product_overall_rating.dart';
import 'package:r_store/features/shop/screens/reviews/widgets/rating_bar_stars.dart';
import 'package:r_store/features/shop/screens/reviews/widgets/user_review_card.dart';
import 'package:r_store/utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RAppBar(
        title: const Text('Product Reviews'),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rating and reviews are verified and are by the people who use same type of device you use',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: RSizes.spaceBtwItems),

              RProductOverallRating(),

              RRatingStarsIndicator(rating: 4.6),
              Text('12,194', style: Theme.of(context).textTheme.bodySmall),

              const SizedBox(height: RSizes.spaceBtwItems),
              for (var i = 0; i < 5; i++) RUserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}



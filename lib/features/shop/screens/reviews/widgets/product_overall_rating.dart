import 'package:flutter/material.dart';
import 'package:r_store/features/shop/screens/reviews/widgets/rating_progress_indicator.dart';

class RProductOverallRating extends StatelessWidget {
  const RProductOverallRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
    
          child: Text(
            '4.7',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
    
        Expanded(
          flex: 7,
          child: Column(
            children: [
              RProgressIndicator(
                rating: '5',
                value: 1,
              ),
              RProgressIndicator(
                rating: '4',
                value: 0.8,
              ),
              RProgressIndicator(
                rating: '3',
                value: 0.6,
              ),
              RProgressIndicator(
                rating: '2',
                value: 0.4,
              ),
              RProgressIndicator(
                rating: '1',
                value: 0.2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
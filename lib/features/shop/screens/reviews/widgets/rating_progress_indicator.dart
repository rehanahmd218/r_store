import 'package:flutter/material.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/sizes.dart';

class RProgressIndicator extends StatelessWidget {
  const RProgressIndicator({
    super.key, required this.rating, required this.value,
  });

  final String rating;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            rating,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
    
        Expanded(
          flex: 13,
          child: LinearProgressIndicator(
            value: value,
            backgroundColor: RColors.grey,
            borderRadius: BorderRadius.all(
              Radius.circular(RSizes.sm),
            ),
            color: RColors.primary,
            minHeight: 10,
          ),
        ),
      ],
    );
  }
}
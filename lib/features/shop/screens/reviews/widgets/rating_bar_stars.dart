import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/utils/constants/colors.dart';

class RRatingStarsIndicator extends StatelessWidget {

  final double rating;
  final double itemSize;

  const RRatingStarsIndicator({
    super.key,
    required this.rating ,
    this.itemSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemPadding: const EdgeInsets.all(0),
      unratedColor: RColors.darkGrey,
      itemSize: itemSize,
      rating: rating,
      itemBuilder: (_,__){
      
      return const Icon(Iconsax.star1,color: RColors.primary,);
      
    });
  }
}
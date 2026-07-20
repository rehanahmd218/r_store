import 'package:flutter/material.dart';
import 'package:r_store/common/widgets/images/rounded_image.dart';
import 'package:r_store/common/widgets/products/product_text/product_title.dart';
import 'package:r_store/common/widgets/texts/brand_title_with_icon.dart';
import 'package:r_store/features/shop/models/cart_item_model.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/image_strings.dart';
import 'package:r_store/utils/constants/sizes.dart';

class RCartItem extends StatelessWidget {
  const RCartItem({
    super.key,
    required this.isDark,
    required this.cartItem,
  });

  final bool isDark;
  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RRoundedImage(
          imgUrl: cartItem.image!,
          width: 60,
          height: 60,
          padding: EdgeInsets.all(RSizes.sm),
          bgColor: isDark ? RColors.darkSurface : RColors.grey,
        ),
        const SizedBox(width: RSizes.spaceBtwItems),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RBrandTitleWithIcon(title: cartItem.brandName ?? ''),
              RProductTitle(
                title: cartItem.title,
                maxLines: 1,
              ),
            if(cartItem.selectedVariation != null && cartItem.selectedVariation!.isNotEmpty) 
              Text.rich(
                TextSpan(
                  children: [
                    for (var entry in cartItem.selectedVariation!.entries) ...[
                      TextSpan(
                        text: '${entry.key}: ${entry.value}, ',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ],
                ),
              ),
             
              const SizedBox(height: RSizes.spaceBtwItems),
          
              
            ],
          ),
        ),
      ],
    );
  }
}
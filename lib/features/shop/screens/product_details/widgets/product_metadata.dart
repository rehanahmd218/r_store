import 'package:flutter/material.dart';
import 'package:r_store/common/widgets/custome_shapes/containers/rounded_container.dart';
import 'package:r_store/common/widgets/images/circular_image.dart';
import 'package:r_store/common/widgets/products/product_text/product_price_text.dart';
import 'package:r_store/common/widgets/texts/brand_title_text.dart';
import 'package:r_store/common/widgets/texts/brand_title_with_icon.dart';
import 'package:r_store/features/shop/controllers/products/products_controller.dart';
import 'package:r_store/features/shop/models/product_model.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/enums.dart';
import 'package:r_store/utils/constants/image_strings.dart';
import 'package:r_store/utils/constants/sizes.dart';

class RProductMetaData extends StatelessWidget {
  const RProductMetaData({super.key , required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductsController.instance;

    final productPrice = controller.getProductPrice(product);
    final stockStatus = controller.getProductStockStatus(product);
    final discountPercentage = controller.calculateSalePercentage(product.price,product.salePrice);


    return Column(
    
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Row(
          spacing: RSizes.spaceBtwItems,
          children: [
            RRoundedContainer(
              radius: RSizes.sm,
              bgColor: RColors.secondary.withValues(alpha: 0.8),
              padding: EdgeInsets.symmetric(
                horizontal: RSizes.sm,
                vertical: RSizes.xs,
              ),
              child: Text(
                discountPercentage,
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.apply(color: RColors.black),
              ),
            ),
            if (product.salePrice > 0)
            RProductPriceText(price: product.price.toString(),lineThrough: true,isLarge: false,),

            RProductPriceText(price: productPrice,isLarge: true,)
          ],
        ),
        const SizedBox(height: RSizes.spaceBtwItems),
        RBrandTitleText(title: product.title,brandTextSize: TextSizes.small,),

        const SizedBox(height: RSizes.spaceBtwItems),
        Row(
          children: [
            Text('Status',style: Theme.of(context).textTheme.bodySmall,),
            const SizedBox(width: RSizes.spaceBtwItems,),
            Text(stockStatus,style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: RSizes.spaceBtwItems),
        Row(children: [
          RCircularImage(imgUrl: product.brand?.image ?? '',width: 32,height: 32,),
          const SizedBox(width: RSizes.spaceBtwItems,),
          RBrandTitleWithIcon(title: product.brand?.name ?? '',)
        ],)
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/common/widgets/custome_shapes/containers/rounded_container.dart';
import 'package:r_store/common/widgets/icons/circular_icon.dart';
import 'package:r_store/common/widgets/images/rounded_image.dart';
import 'package:r_store/common/widgets/products/favourite_icon.dart';
import 'package:r_store/common/widgets/products/product_text/product_price_text.dart';
import 'package:r_store/common/widgets/products/product_text/product_title.dart';
import 'package:r_store/common/widgets/texts/brand_title_with_icon.dart';
import 'package:r_store/data/r_dummy_data.dart';
import 'package:r_store/features/shop/controllers/products/products_controller.dart';
import 'package:r_store/features/shop/models/product_model.dart';
import 'package:r_store/features/shop/screens/product_details/product_details_screen.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/image_strings.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/helpers/helper_functions.dart';

class RProductCardHorizental extends StatelessWidget {
  const RProductCardHorizental({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    final dark = RHelperFunctions.isDarkMode(context);
    final productController = ProductsController.instance;
    final salePercentage = productController.calculateSalePercentage(
      product.price,
      product.salePrice,
    );
    return GestureDetector(
      onTap: () => {Get.to(() => ProductDetailsScreen(product: product))},
      child: RRoundedContainer(
        width: 310,
        showBorder: false,
        bgColor: isDark ? RColors.darkGrey : RColors.containerLight,
        child: Row(
          children: [
            // Thumbnail
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Stack(
                children: [
                  RRoundedImage(
                    imgUrl: product.thumbnail,
                    height: 120,
                    width: 120,
                  ),
                  if (product.salePrice > 0)
                    Positioned(
                      top: RSizes.sm,
                      left: RSizes.xs,
                      child: RRoundedContainer(
                        radius: RSizes.sm,
                        bgColor: RColors.secondary.withValues(alpha: 0.8),
                        padding: EdgeInsets.symmetric(
                          horizontal: RSizes.sm,
                          vertical: RSizes.xs,
                        ),
                        child: Text(
                          salePercentage,
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge!.apply(color: RColors.black),
                        ),
                      ),
                    ),

                  Positioned(
                    top: RSizes.sm,
                    right: RSizes.xs,
                    child: RFavouriteIcon(productId: product.id),
                  ),
                ],
              ),
            ),
            const SizedBox(width: RSizes.sm),

            SizedBox(
              width: 175,
              height: 120,
              child: Padding(
                padding: const EdgeInsets.only(top: RSizes.sm),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,x
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RProductTitle(title: product.title, maxLines: 2),

                    const SizedBox(height: RSizes.spaceBtwItems / 2),
                    RBrandTitleWithIcon(title: product.brand?.name ?? ''),
                    Spacer(),
                    Row(
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (product.productType ==
                                      ProductType.single.name &&
                                  product.salePrice > 0)
                                Text(
                                  '\$${product.price}',
                                  style: Theme.of(context).textTheme.labelSmall!
                                      .apply(
                                        decoration: TextDecoration.lineThrough,
                                        color: RColors.grey,
                                      ),
                                ),

                              RProductPriceText(
                                price: productController.getProductPrice(
                                  product,
                                ),
                                isLarge: false,
                              ),
                            ],
                          ),
                        ),

                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: RColors.black,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(RSizes.cardRadiusMd),
                              bottomRight: Radius.circular(RSizes.cardRadiusMd),
                            ),
                          ),

                          child: Center(
                            child: SizedBox(
                              width: RSizes.iconLg / 1.2,
                              height: RSizes.iconLg / 1.2,
                              child: const Icon(
                                Iconsax.add,
                                color: RColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

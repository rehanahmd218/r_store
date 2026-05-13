import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/common/styles/shadows.dart';
import 'package:r_store/common/widgets/custome_shapes/containers/rounded_container.dart';
import 'package:r_store/common/widgets/icons/circular_icon.dart';
import 'package:r_store/common/widgets/images/rounded_image.dart';
import 'package:r_store/common/widgets/products/cart/product_cart_button.dart';
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

class RProductCardVertical extends StatelessWidget {
  const RProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);
    final productController = ProductsController.instance;
    final salePercentage = productController.calculateSalePercentage(
      product.price,
      product.salePrice,
    );
    
    return GestureDetector(
      onTap: () => {Get.to(() => ProductDetailsScreen(product: product))},
      child: Container(
        width: 180,

        // padding: EdgeInsets.all(),
        decoration: BoxDecoration(
          boxShadow: [RShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(RSizes.productItemRadius),
          color: RHelperFunctions.isDarkMode(context)
              ? RColors.darkerGrey
              : RColors.white,
        ),

        // Main Product Data section
        child: Column(
          children: [
            /// Product Upper Details Section
            /// ( Image, Favorite Icon, Discount Icon)
            RRoundedContainer(
              height: 170,
              width: 180,

              // padding: EdgeInsets.all(4),
              bgColor: dark ? RColors.backgroundDark : RColors.lightGrey,
              child: Stack(
                children: [
                  RRoundedImage(
                    imgUrl: product.thumbnail,
                    applyImgRadius: true,
                    width: double.infinity,
                    height: double.infinity,
                    // isNetworkImg: false,
                  ),

                  if (product.salePrice > 0)
                  
                  RRoundedContainer(
                    
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

                  Positioned(
                    top: 2,
                    right: 2,
                    child: RFavouriteIcon(productId: product.id),
                  ),
                ],
              ),
            ),

            //// Product Details Section
            ///( Title , Brand Name , Price , Add Button )
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(RSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RProductTitle(title: product.title),
                    const SizedBox(height: RSizes.spaceBtwItems / 2),
                    RBrandTitleWithIcon(title: product.brand?.name ?? ''),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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

                        ProductAddToCartButton(
                          product: product,
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



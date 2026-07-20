import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:r_store/common/widgets/texts/section_heading.dart';
import 'package:r_store/features/shop/controllers/products/products_image_controller.dart';
import 'package:r_store/features/shop/controllers/products/variation_controller.dart';
import 'package:r_store/features/shop/models/product_model.dart';
import 'package:r_store/features/shop/screens/checkout/checkout_screen.dart';
import 'package:r_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:r_store/features/shop/screens/product_details/widgets/product_botton_cart.dart';
import 'package:r_store/features/shop/screens/product_details/widgets/product_img_slider.dart';
import 'package:r_store/features/shop/screens/product_details/widgets/product_metadata.dart';
import 'package:r_store/features/shop/screens/product_details/widgets/product_rating_and_share.dart';
import 'package:r_store/features/shop/screens/reviews/reviews_screen.dart';
import 'package:r_store/features/shop/screens/reviews/widgets/user_review_card.dart';
import 'package:r_store/utils/constants/colors.dart';

import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final imagesController = Get.put(ProductsImageController());
    final allImages = imagesController.getAllImagesAgainstProduct(product);
    VariationController.instance.resetSelectedAttributes();
    // print('All Images: $allImages');
    final isDark = RHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: RProductDetailNavigationBar(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
             
            // Product Image Slider
            RProductImageSlider(
              isDark: isDark,
              imgList: allImages,
              productId: product.id,
            ),

            // 2- Product Details

            // - Rating & Share
            Padding(
              padding: EdgeInsets.only(
                left: RSizes.defaultSpace,
                right: RSizes.defaultSpace,
                bottom: RSizes.defaultSpace,
              ),

              // - Price. Title, Stock , & Brand
              child: Column(
                children: [
                  RProductRatingAndShare(isDark: isDark),
                  const SizedBox(height: RSizes.xs),

                  RProductMetaData(product: product),

                  // - Attributes
                  const SizedBox(height: RSizes.spaceBtwItems),

                  if (product.attributes != null &&
                      product.attributes!.isNotEmpty)
                    RProductAttributes(product: product),

                  const SizedBox(height: RSizes.spaceBtwItems),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const CheckoutScreen());
                      },
                      child: Text(
                        'Checkout',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.apply(color: RColors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: RSizes.spaceBtwItems),

                  RSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(height: RSizes.spaceBtwItems),
                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Show less',
                    style:
                        Theme.of(context).textTheme.bodyMedium ??
                        const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                    textAlign: TextAlign.left,
                    moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Divider(),

                  // const SizedBox(height: RSizes.spaceBtwItems),
                  RSectionHeading(
                    title: 'Reviews (199)',
                    showActionButton: true,
                    onButtonPressed: () {
                      Get.to(() => const ProductReviewsScreen());
                    },
                  ),
                  const SizedBox(height: RSizes.spaceBtwItems),
                  // Preview: show 2 reviews inline
                  const RUserReviewCard(),
                  const RUserReviewCard(),
                ],
              ),
            ),
            // - Checkout Button
            // - Description
            // - Reviews
          ],
        ),
      ),
    );
  }
}

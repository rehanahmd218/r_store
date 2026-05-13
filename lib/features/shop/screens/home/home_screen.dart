import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/common/widgets/custome_shapes/containers/primary_header_container.dart';
import 'package:r_store/common/widgets/custome_shapes/containers/search_container.dart';
import 'package:r_store/common/widgets/layout/grid_layout.dart';
import 'package:r_store/common/widgets/loaders/vertical_product_shimmer.dart';
import 'package:r_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:r_store/common/widgets/texts/section_heading.dart';
import 'package:r_store/data/repositories/dataUploading/dummy_data_upload.dart';
import 'package:r_store/features/shop/controllers/cart_item_controller.dart';
import 'package:r_store/features/shop/controllers/products/all_products_controller.dart';
import 'package:r_store/features/shop/controllers/products/favourites_controller.dart';
import 'package:r_store/features/shop/controllers/products/products_controller.dart';
import 'package:r_store/features/shop/screens/all_products/all_products.dart';
import 'package:r_store/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:r_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:r_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/image_strings.dart';
import 'package:r_store/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyDataUpload = Get.put(DummyDataUpload());
    final productsController = Get.put(ProductsController());
    final favoritesController = Get.put(FavouritesController());
    final allProductsController = Get.put(AllProductsController());
    final cartController = Get.put(CartController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            RPrimaryHeaderContainer(
              child: Column(
                children: [
                  RHomeAppBar(),
                  const SizedBox(height: RSizes.spaceBtwSections),

                  // Custom Search Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: RSizes.spaceBtwItems,
                    ),
                    child: RSearchContainer(
                      text: 'Search in Store',
                      showBackground: true,
                      icon: Iconsax.search_normal,
                      onPressed: () {},
                    ),
                  ),

                  const SizedBox(height: RSizes.spaceBtwSections),

                  // Categories Section
                  Padding(
                    padding: const EdgeInsets.only(left: RSizes.defaultSpace),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RSectionHeading(
                            showActionButton: false,
                            title: 'Popular Categories',
                            textColor: RColors.textWhite,
                          ),

                          const SizedBox(height: RSizes.spaceBtwItems),
                          // Categories List
                          RHomeCategories(),

                          //
                          const SizedBox(height: RSizes.spaceBtwSections * 2),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Promo Slider
            RPromoSlider(),
            // ElevatedButton(onPressed:dummyDataUpload.uploadBannersData, child: Text('Upload Banners')),
            // Grid Layout
            Padding(
              padding: EdgeInsets.all(RSizes.defaultSpace),

              child: Column(
                children: [
                  RSectionHeading(
                    title: 'Featured Products',
                    showActionButton: true,
                    onButtonPressed: () {
                      Get.to(
                        () => AllProductsScreen(
                          title: 'Featured Products',
                          productsFuture: allProductsController
                              .fetchAllFeaturedProducts(),
                        ),
                      );
                    },
                  ),
                  Obx(() {
                    if (productsController.isLoading.value) {
                      return RProductCardVerticalShimmer();
                    }
                    if (productsController.featuredProducts.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(RSizes.defaultSpace),
                          child: Text(
                            'No Featured Products Available',
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: RColors.grey),
                          ),
                        ),
                      );
                    }
                    return RGridLayout(
                      itemCount: productsController.featuredProducts.length,
                      itemBuilder: (_, index) {
                        print(
                          'Variations for product ${productsController.featuredProducts[index].id}: ${productsController.featuredProducts[index].variations}',
                        );
                        return RProductCardVertical(
                          product: productsController.featuredProducts[index],
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

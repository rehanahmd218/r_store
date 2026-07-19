import 'package:flutter/material.dart';
import 'package:r_store/common/prefferd_sized/appbar.dart';
import 'package:r_store/common/prefferd_sized/tabbar.dart';
import 'package:r_store/common/widgets/brands/brand_card.dart';
import 'package:r_store/common/widgets/custome_shapes/containers/search_container.dart';
import 'package:r_store/common/widgets/layout/grid_layout.dart';
import 'package:r_store/common/widgets/loaders/r_brands_shimmer.dart';
import 'package:r_store/common/widgets/products/cart/cart_counter.dart';
import 'package:r_store/common/widgets/texts/section_heading.dart';
import 'package:r_store/features/shop/controllers/brand_controller.dart';
import 'package:r_store/features/shop/controllers/categories_controller.dart';
import 'package:r_store/features/shop/controllers/products/products_controller.dart';
import 'package:r_store/features/shop/models/brand_model.dart';
import 'package:r_store/features/shop/screens/all_products/all_products.dart';
import 'package:r_store/features/shop/screens/brand/all_brands.dart';
import 'package:r_store/features/shop/screens/brand/alll_brand_products.dart';
import 'package:r_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:r_store/features/shop/screens/cart/cart_screen.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    final featuredCategories = CategoriesController.instance.featuredCategories;
    final brandController = Get.put(BrandController());

    return Scaffold(
      appBar: RAppBar(
        title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          RCartCounterIcon(
            iconColor: isDark ? RColors.white : RColors.backgroundDark,
            onPressed: () => Get.to(() => const CartScreen()),
          ),
        ],
      ),
      body: DefaultTabController(
        length: featuredCategories.length,
        child: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: isDark ? Colors.transparent : RColors.white,
                expandedHeight: 400,
                flexibleSpace: Padding(
                  padding: EdgeInsets.all(RSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      RSearchContainer(showBackground: false, showBorder: true),
                      const SizedBox(height: RSizes.spaceBtwSections),
                      RSectionHeading(
                        title: 'Featured Brands',
                        showActionButton: true,
                        onButtonPressed: () {
                          Get.to(() => const AllBrandsScreen());
                        },
                      ),
                      const SizedBox(height: RSizes.spaceBtwItems / 2),

                      Obx(
                        () => RGridLayout(
                          mainAxisExtent: 70,
                          itemCount: brandController.featuredBrands.length,
                          itemBuilder: (_, index) {
                            if (brandController.isLoading.value) {
                              return const Center(child: RBrandsShimmer());
                            }
                            if (brandController.featuredBrands.isEmpty) {
                              return const Center(
                                child: Text('No Brands Found'),
                              );
                            }
                            final brand = brandController.featuredBrands[index];
                            return RBrandCard(
                              showBorder: true,
                              onTap: () {
                                Get.to(
                                  () => BrandProductScreen(
                                    title: (brand as BrandModel).name,
                                    brandFuture: ProductsController.instance
                                        .fetchAllBrandProducts(
                                          brandId: brand.id,
                                        ),
                                    brand: brand,
                                  ),
                                );
                              },
                              brand: brand,
                            );
                          },
                        ),
                      ),

                      // const SizedBox(height: RSizes.defaultSpace,),
                    ],
                  ),
                ),
                bottom: RTabBar(
                  tabs: [
                    ...featuredCategories.map(
                      (category) => Tab(text: category.name),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              ...featuredCategories.map(
                (category) => RCategoryTab(category: category, isDark: isDark),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

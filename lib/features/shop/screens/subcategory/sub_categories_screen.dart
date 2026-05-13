import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:r_store/common/prefferd_sized/appbar.dart';
import 'package:r_store/common/widgets/images/rounded_image.dart';
import 'package:r_store/common/widgets/loaders/horizental_product_shimmer.dart';
import 'package:r_store/common/widgets/products/product_cards/product_card_horizental.dart';
import 'package:r_store/common/widgets/texts/section_heading.dart';
import 'package:r_store/features/shop/controllers/categories_controller.dart';
import 'package:r_store/features/shop/controllers/products/products_controller.dart';
import 'package:r_store/features/shop/models/category_model.dart';
import 'package:r_store/features/shop/screens/all_products/all_products.dart';
import 'package:r_store/utils/constants/image_strings.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/helpers/cloud_helper_functions.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final bannerList = [
      RImages.banner1,
      RImages.banner2,
      RImages.banner3,
      RImages.banner4,
      RImages.banner5,
      RImages.banner6,
      RImages.banner7,
      RImages.banner8,
    ];
    return Scaffold(
      appBar: RAppBar(
        title: Text(
          category.name,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            children: [
              RRoundedImage(
                width: double.infinity,
                imgUrl: RImages.banner2,
                applyImgRadius: true,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: RSizes.spaceBtwSections),

              
              FutureBuilder<List<CategoryModel>>(
                future: CategoriesController.instance.fetchSubCategories(
                  category.id,
                ),
                builder: (context, asyncSnapshot) {
                  final widget = RCloudHelperFunctions.checkMultiRecordState(
                    snapshot: asyncSnapshot,
                    loader: RProductCardHorizentalShimmer(),
                  );
                  if (widget != null) return widget;
                  final subCategories =
                      asyncSnapshot.data as List<CategoryModel>;
                  print('Subcategories: $subCategories');
                  if (subCategories.isEmpty) {
                    return Center(
                      child: Text(
                        'No sub-categories found',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.apply(color: Colors.white),
                      ),
                    );
                  }
                  
                  return ListView.builder(
                    itemCount: subCategories.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final subCategory = subCategories[index];
                      return Column(
                        children: [

                          RSectionHeading(
                            title: subCategory.name,
                            showActionButton: true,
                            onButtonPressed: () => {
                              Get.to(() => AllProductsScreen(title: subCategory.name, productsFuture: ProductsController.instance.fetchCategoryProducts(categoryId: subCategory.id)))
                            },
                          ),
                          const SizedBox(height: RSizes.spaceBtwItems),

                        
                          FutureBuilder(
                            future: ProductsController.instance.fetchCategoryProducts(categoryId: subCategory.id, limit: 3),
                            builder: (context, asyncSnapshot) {
                              final widget = RCloudHelperFunctions.checkMultiRecordState(
                                snapshot: asyncSnapshot,
                              );

                              if (widget != null) return widget;
                              final products = asyncSnapshot.data!;
                              if (products.isEmpty) {
                                return Center(
                                  child: Text(
                                    'No products found',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium!.apply(color: Colors.white),
                                  ),
                                );
                              }
                              return SizedBox(
                                height: 120,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (_, index) {
                                    final product = products[index];
                                    return RProductCardHorizental(product: product);
                                  },
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(width: RSizes.spaceBtwItems),
                                  itemCount: 3,
                                ),
                              );
                            }
                          ),

                          SizedBox(height: RSizes.spaceBtwSections),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

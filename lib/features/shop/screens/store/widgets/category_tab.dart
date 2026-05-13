import 'package:flutter/material.dart';
import 'package:r_store/common/widgets/brands/brand_showcase.dart';
import 'package:r_store/common/widgets/layout/grid_layout.dart';
import 'package:r_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:r_store/common/widgets/texts/section_heading.dart';
import 'package:r_store/features/shop/controllers/brand_controller.dart';
import 'package:r_store/features/shop/controllers/products/products_controller.dart';
import 'package:r_store/features/shop/models/brand_model.dart';
import 'package:r_store/features/shop/models/category_model.dart';
import 'package:r_store/features/shop/models/product_model.dart';
import 'package:r_store/utils/constants/image_strings.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/helpers/cloud_helper_functions.dart';

class RCategoryTab extends StatelessWidget {
  const RCategoryTab({super.key, required this.isDark, required this.category});
  final CategoryModel category;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.fetchFeaturedCategoryBrands(categoryId: category.id),
      builder: (context, asyncSnapshot) {
        final widget = RCloudHelperFunctions.checkMultiRecordState(
          snapshot: asyncSnapshot,
        );
        if (widget != null) return widget;
        final brands = asyncSnapshot.data as List<BrandModel>;
        return ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(RSizes.defaultSpace),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  ...brands.map((brand) {
                    return FutureBuilder(
                      future: ProductsController.instance.fetchAllBrandProducts(
                        brandId: brand.id,
                        limit: 3,
                      ),
                      builder: (context, snapshot) {
                        final widget =
                            RCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot,
                            );

                        if (widget != null) return widget;
                        final allBrands = snapshot.data as List<ProductModel>;
                        final imgList = allBrands.map((e) => e.thumbnail).toList();
                        
                        return RBrandShowCase(
                          isDark: isDark,
                          brand: brand,
                          images: imgList,
                        );
                      },
                    );
                  }),
                  const SizedBox(height: RSizes.spaceBtwItems / 2),
                  // RBrandShowCase(isDark: isDark, images: [RImages.productImage1, RImages.productImage2, RImages.productImage3]),
                  RSectionHeading(
                    title: 'You might like',
                    showActionButton: true,
                  ),
                  const SizedBox(height: RSizes.spaceBtwItems / 2),
                  RGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) {
                      return RProductCardVertical(
                        product: ProductModel.empty(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

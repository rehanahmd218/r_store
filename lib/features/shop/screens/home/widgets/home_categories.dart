import 'package:flutter/material.dart';
import 'package:r_store/common/widgets/image_text/vertical_image_text.dart';
import 'package:get/get.dart';
import 'package:r_store/features/shop/controllers/categories_controller.dart';
import 'package:r_store/features/shop/screens/home/widgets/r_categories_shimmer.dart';
import 'package:r_store/features/shop/screens/subcategory/sub_categories_screen.dart';

class RHomeCategories extends StatelessWidget {
  RHomeCategories({super.key});

  final categoryController = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      
      () {
      if (categoryController.isLoading.value) {
        return const Center(child: RCategoriesShimmer());
      }

      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No categories found',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.apply(color: Colors.white),
          ),
        );
      }

      return SizedBox(
        height: 80,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final category = categoryController.featuredCategories[index];
            return RVerticalImageText(
              image: category.imageUrl,
              title: category.name,
              
              onTap: () {
                Get.to(() => SubCategoriesScreen(category: category));
              },
            );
          },
          itemCount: categoryController.featuredCategories.length,
          shrinkWrap: true,
        ),
      );
    });
  }
}

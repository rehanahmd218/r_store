import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/common/prefferd_sized/appbar.dart';
import 'package:r_store/common/widgets/icons/circular_icon.dart';
import 'package:r_store/common/widgets/layout/grid_layout.dart';
import 'package:r_store/common/widgets/loaders/animation_loader.dart';
import 'package:r_store/common/widgets/loaders/vertical_product_shimmer.dart';
import 'package:r_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:r_store/features/shop/controllers/products/favourites_controller.dart';
import 'package:r_store/features/shop/controllers/products/products_controller.dart';
import 'package:r_store/features/shop/models/product_model.dart';
import 'package:r_store/features/shop/screens/home/home_screen.dart';
import 'package:r_store/utils/constants/image_strings.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/helpers/cloud_helper_functions.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          RCircularIcon(
            icon: Iconsax.add,
            onPressed: () {
              Get.to(HomeScreen());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(RSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Obx(
            () => FutureBuilder(
              future: ProductsController.instance.fetchFavoriteProducts(
                FavouritesController.instance.favourites.keys.toList(),
              ),
              builder: (context, snapshot) {
                final widget = RCloudHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot,
                  loader: RProductCardVerticalShimmer(),
                );
                
                if (widget != null) return widget;
                final products = snapshot.data as List<ProductModel>;
                if (products.isEmpty) {
                  return RAnimationLoaderWidget(text: 'Whoops! No products in your wishlist yet!', animation: RImages.emptyWishListIllustration);
                }
                return RGridLayout(
                  itemCount: products.length,
                  itemBuilder: (_, index) {
                    return RProductCardVertical(product: products[index]);
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

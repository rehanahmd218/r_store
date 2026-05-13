import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/common/widgets/icons/circular_icon.dart';
import 'package:r_store/features/shop/controllers/products/favourites_controller.dart';

class RFavouriteIcon extends StatelessWidget {
  const RFavouriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    
    return Obx(
      () => RCircularIcon(
        icon: controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
        iconColor: controller.isFavourite(productId) ? Colors.red : null,
        onPressed: () {
          controller.toggleFavourite(productId);
        },
      ),
    );
  }
}

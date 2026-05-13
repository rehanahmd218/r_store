import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/data/r_dummy_data.dart';
import 'package:r_store/features/shop/controllers/cart_item_controller.dart';
import 'package:r_store/features/shop/models/product_model.dart';
import 'package:r_store/features/shop/screens/product_details/product_details_screen.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/sizes.dart';

class ProductAddToCartButton extends StatelessWidget {
  const ProductAddToCartButton({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx(() {
      final quantityInCart = cartController.getProductQuantityInCart(
        product.id,
      );
      return InkWell(
        onTap: () {
          if (product.productType == ProductType.single.name) {
            final cartItem = cartController.convertToCartItem(product, 1);
            cartController.addSingleItemToCart(cartItem);
          } else {
            Get.to(() => ProductDetailsScreen(product: product));
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: quantityInCart > 0 ? RColors.primary : RColors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(RSizes.cardRadiusMd),
              bottomRight: Radius.circular(RSizes.cardRadiusMd),
            ),
          ),
          child: Center(
            child: SizedBox(
              width: RSizes.iconLg / 1.2,
              height: RSizes.iconLg / 1.2,
              child: quantityInCart > 0
                  ? Center(
                    child: Text(
                        quantityInCart.toString(),
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge!.apply(color: RColors.white),
                      ),
                  )
                  : Icon(Iconsax.add, color: RColors.white),
            ),
          ),
        ),
      );
    });
  }
}

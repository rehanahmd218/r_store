import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/common/widgets/icons/circular_icon.dart';
import 'package:r_store/features/shop/controllers/cart_item_controller.dart';
import 'package:r_store/features/shop/models/product_model.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/helpers/helper_functions.dart';

class RProductDetailNavigationBar extends StatelessWidget {
  const RProductDetailNavigationBar({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    final cartController = CartController.instance;
    cartController.updateAlreadyAddedProductQuantity(product);
    return Container(
      padding: const EdgeInsets.all(RSizes.sm),
      decoration: BoxDecoration(
        color: isDark ? RColors.darkSurface : RColors.grey,
        borderRadius: BorderRadius.circular(RSizes.sm),
        border: isDark ? Border.all(color: RColors.darkCardBorder, width: 1) : null,
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black54 : Colors.grey.shade300,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Obx(

        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                RCircularIcon(
                  icon: Iconsax.minus,
                  width: 40,
                  height: 40,
                  bgColor: isDark ? RColors.darkImageBg : RColors.darkGrey,
                  iconColor: RColors.white,
                  onPressed: () {
                    cartController.productQuantityinCart.value > 0
                        ? cartController.productQuantityinCart.value--
                        : null;
                  },
                ),
                const SizedBox(width: RSizes.spaceBtwItems),
                Text('${cartController.productQuantityinCart.value}', style: Theme.of(context).textTheme.bodyMedium),

                const SizedBox(width: RSizes.spaceBtwItems),
                RCircularIcon(
                  icon: Iconsax.add,
                  width: 40,
                  height: 40,
                  bgColor: isDark ? RColors.primary : RColors.black,
                  iconColor: RColors.white,
                  onPressed: () {
                    cartController.productQuantityinCart.value++;
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: cartController.productQuantityinCart.value < 1 ? null : ()=> cartController.addToCart(product),
              style: ElevatedButton.styleFrom(
                backgroundColor: isDark ? RColors.primary : RColors.black,
                side: BorderSide(color: isDark ? RColors.primary : RColors.black),
                padding: EdgeInsets.symmetric(
                  horizontal: RSizes.defaultSpace,
                  vertical: RSizes.sm,
                ),
              ),
              child: Text(
                'Add to Cart',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.apply(color: RColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

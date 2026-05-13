import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/common/widgets/icons/circular_icon.dart';
import 'package:r_store/features/shop/controllers/cart_item_controller.dart';
import 'package:r_store/features/shop/models/cart_item_model.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/sizes.dart';

class RCartQuantiyUpdater extends StatelessWidget {
  const RCartQuantiyUpdater({
    super.key,
    required this.isDark,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: RSizes.sm,
      children: [
        RCircularIcon(
          icon: Iconsax.minus,
          bgColor: isDark ? RColors.darkGrey : RColors.grey,
          width: 24,
          height: 24,
          onPressed: () => controller.removeSingleItemFromCart(cartItem),
        ),

        Obx(
          () => Text(
            '${controller.getProductQuantityInCart(cartItem.productId)}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),

        RCircularIcon(
          icon: Iconsax.add,
          bgColor: RColors.primary,
          iconColor: RColors.white,
          width: 24,
          height: 24,
          onPressed: () {
            controller.addSingleItemToCart(cartItem);
          },
        ),
      ],
    );
  }
}

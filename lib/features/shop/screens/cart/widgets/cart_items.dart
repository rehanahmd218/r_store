import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:r_store/common/widgets/products/product_text/product_price_text.dart';
import 'package:r_store/features/shop/controllers/cart_item_controller.dart';
import 'package:r_store/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:r_store/features/shop/screens/cart/widgets/cart_quantity_updater.dart';
import 'package:r_store/utils/constants/sizes.dart';

class RCartItems extends StatelessWidget {
  const RCartItems({
    super.key,
    required this.isDark,
    this.showValueEditButtons = true,
  });

  final bool isDark;
  final bool showValueEditButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(() {
      if (cartController.cartItems.isEmpty) {
        return Center(
          child: Text(
            'Your cart is empty',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        );
      }

      return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (_, index) {
          final cartItem = cartController.cartItems[index];
          // return RCartItem(isDark: isDark);
          return Column(
            children: [
              RCartItem(isDark: isDark, cartItem: cartItem),
              if (showValueEditButtons)
                Row(
                  // mainAxisAlignment: MainAxisAlignment.,
                  children: [
                    const SizedBox(width: 70),
                    RCartQuantiyUpdater(isDark: isDark, cartItem: cartItem),
                    Spacer(),

                    RProductPriceText(
                      price: cartItem.price.toString(),
                      isLarge: true,
                    ),
                  ],
                ),
            ],
          );
        },
        separatorBuilder: (_, __) =>
            const SizedBox(height: RSizes.spaceBtwSections),
        itemCount: cartController.cartItems.length,
      );
    });
  }
}

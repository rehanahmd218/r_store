import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:r_store/common/prefferd_sized/appbar.dart';
import 'package:r_store/features/shop/controllers/cart_item_controller.dart';
import 'package:r_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:r_store/features/shop/screens/checkout/checkout_screen.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/helpers/helper_functions.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(RSizes.md),
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => CheckoutScreen());
          },
          child: Obx(() {
            if (CartController.instance.cartItems.isNotEmpty) {
              return Text(
                'Checkout \$${CartController.instance.totalPrice.value.toStringAsFixed(2)}',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.apply(color: RColors.white),
              );
            } else {
              return SizedBox();
            }
          }),
        ),
      ),
      appBar: RAppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.titleMedium),
        showBackButton: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(RSizes.defaultSpace),
        child: RCartItems(isDark: isDark),
      ),
    );
  }
}

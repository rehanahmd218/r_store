import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:r_store/common/prefferd_sized/appbar.dart';
import 'package:r_store/common/screens/success_screen.dart';
import 'package:r_store/common/widgets/custome_shapes/containers/rounded_container.dart';
import 'package:r_store/common/widgets/products/cart/coupon_field.dart';
import 'package:r_store/features/shop/controllers/address_controller.dart';
import 'package:r_store/features/shop/controllers/cart_item_controller.dart';
import 'package:r_store/features/shop/controllers/checkout_controller.dart';
import 'package:r_store/features/shop/controllers/order_controller.dart';
import 'package:r_store/features/shop/models/order_model.dart';
import 'package:r_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:r_store/features/shop/screens/checkout/widgets/checkout_address_section.dart';
import 'package:r_store/features/shop/screens/checkout/widgets/checkout_amount_section.dart';
import 'package:r_store/features/shop/screens/checkout/widgets/checkout_payment_section.dart';
import 'package:r_store/utils/constants/enums.dart';
import 'package:r_store/utils/constants/image_strings.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/helpers/helper_functions.dart';
import 'package:r_store/utils/helpers/pricing_calculator.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    final checkoutController = Get.put(CheckoutController());
    final orderController = Get.put(OrderController());
    final subTotal = RPricingCalculator.calculateTotalPrice(
      CartController.instance.totalPrice.value,
      'us',
    ).toStringAsFixed(2);

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(RSizes.spaceBtwItems),

        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              orderController.processOrder(
                  
                
              );
            },
            child: Text('Checkout \$$subTotal'),
          ),
        ),
      ),
      appBar: RAppBar(
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            children: [
              // Add your checkout items here
              // Cart Items
              RCartItems(isDark: isDark, showValueEditButtons: false),
              const SizedBox(height: RSizes.spaceBtwItems),
              // Coupon Code Field
              RCouponCodeField(isDark: isDark),

              const SizedBox(height: RSizes.spaceBtwSections),
              // Amount Section
              RRoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(RSizes.md),

                child: Column(
                  children: [
                    RCheckoutAmountSection(),
                    const SizedBox(height: RSizes.spaceBtwItems / 2),

                    RCheckoutPaymentMethod(),

                    // Address Section
                    RCheckoutAddressSection(),

                    // Checkout Button
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

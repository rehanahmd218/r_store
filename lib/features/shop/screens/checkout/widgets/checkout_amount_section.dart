import 'package:flutter/material.dart';
import 'package:r_store/features/shop/controllers/cart_item_controller.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/helpers/helper_functions.dart';
import 'package:r_store/utils/helpers/pricing_calculator.dart';

class RCheckoutAmountSection extends StatelessWidget {
  const RCheckoutAmountSection({super.key});

  @override
  Widget build(BuildContext context) {

    final cartController = CartController.instance;
    final subTotal = cartController.totalPrice.value;

    return Column(
      spacing: RSizes.sm,
      children: [
        singlePaymentLabel(context, 'Subtotal:', '\$${subTotal.toStringAsFixed(2)}'),
        singlePaymentLabel(context, 'Shipping Fee:', '\$${RPricingCalculator.calculateShippingCost(100, 'us')}'),
        singlePaymentLabel(context, 'Tax Fee:', '\$${RPricingCalculator.calculateTax(subTotal,'us')}'),
        singlePaymentLabel(context, 'Total Payable:', '\$${RPricingCalculator.calculateTotalPrice(subTotal, 'us').toStringAsFixed(2)}'),
        Divider(),
      ],
    );
  }

  Row singlePaymentLabel(BuildContext context, String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(width: RSizes.spaceBtwItems),
        Text(value, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
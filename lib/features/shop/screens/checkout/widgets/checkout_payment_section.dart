import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:r_store/common/widgets/images/rounded_image.dart';
import 'package:r_store/common/widgets/texts/section_heading.dart';
import 'package:r_store/features/shop/controllers/checkout_controller.dart';
import 'package:r_store/utils/constants/image_strings.dart';
import 'package:r_store/utils/constants/sizes.dart';

class RCheckoutPaymentMethod extends StatelessWidget {
  const RCheckoutPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final checkOutController = Get.put(CheckoutController());
    return Column(
      children: [
        RSectionHeading(
          title: 'Payment Method',
          showActionButton: true,
          buttonTitle: 'Change',
          onButtonPressed: () => checkOutController.changePaymentMethod(),
        ),
        const SizedBox(height: RSizes.spaceBtwItems / 2),
        Obx(
          () => Row(
            children: [
              const SizedBox(width: RSizes.spaceBtwItems),
              RRoundedImage(imgUrl: checkOutController.selectedPaymentMethod.value.image, width: 40, height: 40),
              const SizedBox(width: RSizes.spaceBtwItems),
              Text(
                checkOutController.selectedPaymentMethod.value.name,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: RSizes.spaceBtwItems),
      ],
    );
  }
}

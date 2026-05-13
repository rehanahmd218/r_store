import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_store/common/widgets/images/rounded_image.dart';
import 'package:r_store/features/shop/controllers/checkout_controller.dart';
import 'package:r_store/features/shop/models/payment_method_model.dart';

class RPaymentMethodTile extends StatelessWidget {
  const RPaymentMethodTile({super.key, required this.paymethod});

  final PaymentMethodModel paymethod;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      
      leading: RRoundedImage(imgUrl: paymethod.image, width: 40, height: 40),
      title: Center(child: Text(paymethod.name,style: Theme.of(context).textTheme.bodyMedium,)),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Handle payment method selection
        CheckoutController.instance.selectedPaymentMethod.value = paymethod;
        Get.back();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_store/common/widgets/texts/section_heading.dart';
import 'package:r_store/features/shop/models/payment_method_model.dart';
import 'package:r_store/features/shop/screens/checkout/widgets/payment_list_tile.dart';
import 'package:r_store/utils/constants/image_strings.dart';
import 'package:r_store/utils/constants/sizes.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.isRegistered<CheckoutController>()
      ? Get.find<CheckoutController>()
      : Get.put(CheckoutController());

  Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    super.onInit();
    selectedPaymentMethod.value = PaymentMethodModel(
      name: 'Paypal',
      image: RImages.paypal,
    );
  }

  void changePaymentMethod() {
    showModalBottomSheet(
      context: Get.context!,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(RSizes.defaultSpace),
            child: Column(
              spacing: RSizes.spaceBtwItems,
              children: [
                RSectionHeading(
                  title: 'Select Payment Method',
                  showActionButton: false,
                ),
                SizedBox(height: 10,),
                RPaymentMethodTile(paymethod: PaymentMethodModel(name: 'Paypal', image: RImages.paypal)),
                RPaymentMethodTile(paymethod: PaymentMethodModel(name: 'Paytm', image: RImages.paytm)),
                RPaymentMethodTile(paymethod: PaymentMethodModel(name: 'Apple Pay', image: RImages.applePay)),
                RPaymentMethodTile(paymethod: PaymentMethodModel(name: 'Google Pay', image: RImages.googlePay)),
                RPaymentMethodTile(paymethod: PaymentMethodModel(name: 'Paystack', image: RImages.paystack)),
                RPaymentMethodTile(paymethod: PaymentMethodModel(name: 'Visa', image: RImages.visa)),
                RPaymentMethodTile(paymethod: PaymentMethodModel(name: 'MasterCard', image: RImages.masterCard)),
                RPaymentMethodTile(paymethod: PaymentMethodModel(name: 'Credit Card', image: RImages.creditCard)),
                RPaymentMethodTile(paymethod: PaymentMethodModel(name: 'Cash on Delivery', image: RImages.cashOnDelivery)),
              ],
            ),
          ),
        );
      },
    );
  }
}

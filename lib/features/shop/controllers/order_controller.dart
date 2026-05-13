import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:r_store/common/screens/success_screen.dart';
import 'package:r_store/data/repositories/orders/order_repository.dart';
import 'package:r_store/features/shop/controllers/address_controller.dart';
import 'package:r_store/features/shop/controllers/cart_item_controller.dart';
import 'package:r_store/features/shop/controllers/checkout_controller.dart';
import 'package:r_store/features/shop/models/order_model.dart';
import 'package:r_store/navigation_menu.dart';
import 'package:r_store/utils/constants/enums.dart';
import 'package:r_store/utils/constants/image_strings.dart';
import 'package:r_store/utils/popups/full_screen_loader.dart';
import 'package:r_store/utils/popups/loaders.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.isRegistered<OrderController>()
      ? Get.find<OrderController>()
      : Get.put(OrderController());

  RxList<OrderModel> orderList = <OrderModel>[].obs;

  final AddressController _addressController = AddressController.instance;
  final CartController _cartController = CartController.instance;
  final CheckoutController _checkoutController = CheckoutController.instance;
  final _orderRepo = Get.put(OrderRepository());

  Future<void> processOrder() async {
    final userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    if (userId.isEmpty) {
      RLoaders.errorSnackBar(title: 'Error', message: 'User not authenticated');
      return;
    }

    if (_cartController.totalPrice.value <= 0) {
      RLoaders.warningSnackBar(title: 'Warning', message: 'Cart is empty');
      return;
    }

    if (_addressController.selectedAddress.value.id.isEmpty) {
      RLoaders.warningSnackBar(
        title: 'Warning',
        message: 'Please select an address',
      );
      return;
    }

    if (_checkoutController.selectedPaymentMethod.value.name.isEmpty) {
      RLoaders.warningSnackBar(
        title: 'Warning',
        message: 'Please select a payment method',
      );
      return;
    }

    final order = OrderModel(
      id: UniqueKey().toString(),
      userId: userId,
      status: OrderStatus.processing,
      items: CartController.instance.cartItems,
      totalAmount: double.parse(
        _cartController.totalPrice.value.toStringAsFixed(2),
      ),
      orderDate: DateTime.now(),
      address: AddressController.instance.selectedAddress.value,
      paymentMethod:
          CheckoutController.instance.selectedPaymentMethod.value.name,
      deliveryDate: DateTime.now().add(
        Duration(days: 7),
      ), // Example delivery date
    );

    RFullScreenLoader.openLoadingDialog(
      'Processing Order...',
      RImages.loaderDocerAnimation,
    );
    try {
      await _orderRepo.saveOrder(userId, order);
      RLoaders.successSnackBar(
        title: 'Success',
        message: 'Order placed successfully',
      );
      _cartController.clearCart();
      RFullScreenLoader.stopLoading();
      Get.to(
        () => SuccessScreen(
          image: RImages.verifyIllustration,
          title: 'Payment Success!',
          subtitle: 'Your payment was successful.',
          onPressed: () {
            Get.offAll(() => NavigationMenu());
          },
        ),
      );
    } catch (e) {
      RLoaders.errorSnackBar(title: 'Error', message: 'Failed to place order');
      RFullScreenLoader.stopLoading();
    } finally {}
  }

  Future<List<OrderModel>> getOrders() async {
    try {
      orderList.value = await _orderRepo.fetchUserOrders(
        FirebaseAuth.instance.currentUser?.uid ?? '',
      );
      return orderList.toList();
    } catch (e) {
      RLoaders.errorSnackBar(title: 'Error', message: e.toString());
      return [];
    }
  }
}

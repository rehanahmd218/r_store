import 'package:get/get.dart';
import 'package:r_store/data/r_dummy_data.dart';
import 'package:r_store/features/shop/controllers/products/variation_controller.dart';
import 'package:r_store/features/shop/models/cart_item_model.dart';
import 'package:r_store/features/shop/models/product_model.dart';
import 'package:r_store/utils/local_storage/storage_utility.dart';
import 'package:r_store/utils/popups/loaders.dart';

class CartController extends GetxController {
  static CartController get instance => Get.isRegistered<CartController>()
      ? Get.find<CartController>()
      : Get.put(CartController());
  RxInt cartItemCount = 0.obs;
  RxDouble totalPrice = 0.0.obs;
  RxInt productQuantityinCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

  final VariationController variationController = Get.put(
    VariationController(),
  );

  CartController() {
    loadCartItems();
  }

  void addToCart(ProductModel product) {
    if (productQuantityinCart < 0) {
      RLoaders.warningSnackBar(
        title: 'Warning',
        message: 'Please Select Some items',
      );
      return;
    }

    if (product.productType == ProductType.variable.name &&
        variationController.selectedVariation.value.id.isEmpty) {
      RLoaders.warningSnackBar(
        title: 'Warning',
        message: 'Please Select a Variation',
      );
      return;
    }

    if (product.productType == ProductType.variable.name) {
      if (variationController.selectedVariation.value.stockQuantity < 1) {
        RLoaders.warningSnackBar(
          title: 'Warning',
          message: 'Selected Variation is out of stock',
        );
        return;
      }
    } else {
      if (product.stockQuantity < 1) {
        RLoaders.warningSnackBar(
          title: 'Warning',
          message: 'Product is out of stock',
        );
        return;
      }
    }

    final cartItem = convertToCartItem(product, productQuantityinCart.value);
    final int index = cartItems.indexWhere((item) {
      return item.productId == cartItem.productId &&
          item.variationId == cartItem.variationId;
    });

    if (index >= 0) {
      cartItems[index].quantity = cartItem.quantity;
    } else {
      cartItems.add(cartItem);
    }

    updateCart();
    RLoaders.customToast(message: 'Item added to cart');
  }

  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void saveCartItems() {
    RLocalStorage().saveData(
      'cartItems',
      cartItems.map((e) => e.toJson()).toList(),
    );
  }

  void addSingleItemToCart(CartItemModel cartItem) {
    final int index = cartItems.indexWhere((item) {
      return item.productId == cartItem.productId &&
          item.variationId == cartItem.variationId;
    });

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(cartItem);
    }

    updateCart();
  }

  void removeSingleItemFromCart(CartItemModel cartItem) {
    final int index = cartItems.indexWhere((item) {
      return item.productId == cartItem.productId &&
          item.variationId == cartItem.variationId;
    });

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        removeFromCartDialogConfirmation(index);
      }
      updateCart();
    }
  }

  void removeFromCartDialogConfirmation(int index) {
    Get.defaultDialog(
      title: 'Remove Item',
      middleText: 'Are you sure you want to remove this item from the cart?',
      textCancel: 'No',
      textConfirm: 'Yes',
      onConfirm: () {
        cartItems.removeAt(index);

        Get.back(); // Close the dialog
      },
      onCancel: () {
        // Get.back(); // Close the dialog
      },
    );
  }

  void loadCartItems() {
    final List<dynamic>? storedItems = RLocalStorage().readData('cartItems');
    if (storedItems != null) {
      cartItems.value = storedItems
          .map((item) => CartItemModel.fromJson(item))
          .toList();
      updateCartTotals();
    }
  }

  void updateCartTotals() {
    double calculatePrice = 0;
    int totalProductQuantity = 0;
    for (var item in cartItems) {
      totalProductQuantity += item.quantity;
      calculatePrice += item.price * item.quantity;
    }

    cartItemCount.value = totalProductQuantity;
    totalPrice.value = calculatePrice;
  }

  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.name) {
      variationController.resetSelectedAttributes();
    }

    final isVariation =
        variationController.selectedVariation.value.id.isNotEmpty;
    final selectedVariation = variationController.selectedVariation.value;
    final price = isVariation
        ? selectedVariation.salePrice > 0
              ? selectedVariation.salePrice
              : selectedVariation.price
        : product.salePrice > 0
        ? product.salePrice
        : product.price;

    final cartItem = CartItemModel(
      productId: product.id,
      title: product.title,
      price: price,
      image: product.thumbnail,
      quantity: quantity,
      variationId: isVariation ? selectedVariation.id : "",
      brandName: product.brand?.name,
      selectedVariation: isVariation ? selectedVariation.attributeValues : null,
    );

    return cartItem;
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getProductVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
      (item) => item.productId == productId && item.variationId == variationId,
      orElse: () => CartItemModel.empty(),
    );
    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityinCart.value = 0;
    cartItems.clear();
    updateCart();
  }

  void updateAlreadyAddedProductQuantity(ProductModel product) {
    if (product.productType == ProductType.single.name) {
      productQuantityinCart.value = getProductQuantityInCart(product.id);
    } else if (product.productType == ProductType.variable.name) {
      final variationId = variationController.selectedVariation.value.id;
      if (variationId.isNotEmpty) {
        productQuantityinCart.value = getProductVariationQuantityInCart(
          product.id,
          variationId,
        );
      } else {
        productQuantityinCart.value = 0;
      }
    } else {
      productQuantityinCart.value = 0;
    }
  }
}

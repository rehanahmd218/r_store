import 'package:get/get.dart';
import 'package:r_store/features/shop/controllers/cart_item_controller.dart';
import 'package:r_store/features/shop/controllers/products/products_image_controller.dart';
import 'package:r_store/features/shop/models/product_model.dart';
import 'package:r_store/features/shop/models/product_variation.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.isRegistered<VariationController>()
      ? Get.find<VariationController>()
      : Get.put(VariationController());

  //   Variables
  RxMap selectedAttributes = {}.obs;

  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  // Select Attribute and Variation
  void onAttributeSelected(
    ProductModel product,
    attributeName,
    attributeValue,
  ) {
    // When attribute is selected we will first add that attribute to the selectedAttributes
    final selectedAttributes = Map<String, dynamic>.from(
      this.selectedAttributes,
    );

    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.variations!.firstWhere(
      (variation) => _isSameAttributesValues(
        variation.attributeValues,
        selectedAttributes,
      ),
      orElse: () => ProductVariationModel.empty(),
    );
    // Show the selected variation image as a main image
    if (selectedVariation.image.isNotEmpty) {
      ProductsImageController.instance.selectedImage.value =
          selectedVariation.image;
    }

    // show selected variation quantity already in the cart

    if (selectedVariation.id.isNotEmpty) {
      final cartController = CartController.instance;

      cartController.productQuantityinCart.value = cartController
          .getProductVariationQuantityInCart(product.id, selectedVariation.id);
    }

    //   Assign selected variation
    this.selectedVariation.value = selectedVariation;
    //   Update selected product variation
    getProductVariationStockStatus();
  }

  // Check if selected attributes match any variation attributes
  bool _isSameAttributesValues(
    Map<String, dynamic> variationAttributes,
    Map<String, dynamic> selectedAttributes,
  ) {
    //     if selectedAttributes contains 3 attributes and current variation contains 2 then return
    if (variationAttributes.length != selectedAttributes.length) {
      return false;
    }
    // if any of the attributes is different then return. e.g.[Green,Large] x [Green,Small]

    for (final key in variationAttributes.keys) {
      // Attributes[key] = Value which could be [Green, Small, Cotton] etc.
      if (variationAttributes[key] != selectedAttributes[key]) {
        return false;
      }
    }
    return true;
  }

  // Check Attribute availability/stock in variation

  Set<String?> getAttributesAvailabilityInVariation(
    List<ProductVariationModel> variations,
    String attributeName,
  ) {
    // Pass the variation to check which attributes are available and stock is not 0
    final availableVariationAttributeValues = variations
        .where(
          (variation) =>
              // check empty/out of stock
              variation.attributeValues[attributeName] != null &&
              variation.attributeValues[attributeName]!.isNotEmpty &&
              variation.stockQuantity > 0,
        )
        //   fetch all non-empty attributes of variations
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();
    return availableVariationAttributeValues;
  }

  //   Check product variation stock status
  void getProductVariationStockStatus() {
    variationStockStatus.value = selectedVariation.value.stockQuantity > 0
        ? 'In Stock'
        : 'Out of Stock';
  }

  //   Reset selected attribute when switching product
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }

  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0
            ? selectedVariation.value.salePrice
            : selectedVariation.value.price)
        .toString();
  }
}

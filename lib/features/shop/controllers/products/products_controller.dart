import 'package:flutter/src/widgets/container.dart';
import 'package:get/get.dart';
import 'package:r_store/data/r_dummy_data.dart';
import 'package:r_store/data/repositories/products/product_respository.dart';
import 'package:r_store/features/shop/models/product_model.dart';
import 'package:r_store/utils/popups/loaders.dart';

class ProductsController extends GetxController {
  static ProductsController get instance => Get.isRegistered<ProductsController>()
      ? Get.find<ProductsController>()
      : Get.put(ProductsController());

  final RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  late ProductRespository productRespository;

  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    productRespository = Get.put(ProductRespository());
    fetchFeaturedProducts();
  }

  Future<void> fetchFeaturedProducts() async {
    isLoading.value = true;
    featuredProducts.value = await productRespository.fetchFeaturedProducts();
    isLoading.value = false;
  }

  String getProductPrice(ProductModel product) {
    if (product.productType == ProductType.single.name) {
      return '${product.salePrice > 0 ? product.salePrice : product.price}\$';
    } else if (product.productType == ProductType.variable.name) {
      final prices = product.variations!.map((e) => e.price).toList();
      prices.sort();
      return '${prices.first} - ${prices.last}';
    } else {
      return '0';
    }
  }

  String getProductStockStatus(ProductModel product) {
    return product.stockQuantity > 0 ? 'In Stock' : 'Out of Stock';
  }

  String calculateSalePercentage(double originalPrice, double salePrice) {
    if (originalPrice <= 0 || salePrice <= 0 || salePrice >= originalPrice) {
      return '';
    }
    final discount = ((originalPrice - salePrice) / originalPrice) * 100;
    return '${discount.toStringAsFixed(0)}%';
  }

  Future<List<ProductModel>> fetchAllBrandProducts({
    required String brandId,
    int limit = -1,
  }) async {
    try {
      final products = await productRespository.fetchAllBrandProducts(
        id: brandId,
        limit: limit,
      );
      return products;
    } catch (e) {
      print('Error fetching brand products: $e');
      RLoaders.errorSnackBar(title: 'Error', message: e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> fetchFavoriteProducts(
    List<String> productIds,
  ) async {
    try {
      if (productIds.isEmpty) return [];
      return await productRespository.fetchAllFavoriteProducts(productIds);
    } catch (e) {
      print('Error fetching product by ID: $e');
      RLoaders.errorSnackBar(title: 'Error', message: e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> fetchCategoryProducts({
    required String categoryId,
    int limit = -1,
  }) async {
    try {
      return await productRespository.fetchCategoryProducts(
        categoryId: categoryId,
        limit: limit,
      );
    } catch (e) {
      print('Error fetching category products: $e');
      RLoaders.errorSnackBar(title: 'Error', message: e.toString());
      return [];
    }
  }
}

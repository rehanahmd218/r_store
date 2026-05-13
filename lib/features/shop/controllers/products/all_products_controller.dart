import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:r_store/common/requests/request_with_exception.dart';
import 'package:r_store/data/repositories/products/product_respository.dart';
import 'package:r_store/features/shop/models/product_model.dart';
import 'package:r_store/utils/popups/loaders.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.isRegistered<AllProductsController>()
      ? Get.find<AllProductsController>()
      : Get.put(AllProductsController());

  final RxString selectedSortOption = 'Name'.obs;

  final RxList<ProductModel> allProducts = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      return runFirebaseSafely(() async {
        final tempProducts = await ProductRespository.to
            .fetchAllFeaturedProducts();
        allProducts.assignAll(tempProducts);
        return tempProducts;
      });
    } catch (e) {
      print('Error fetching featured products: $e');
      RLoaders.errorSnackBar(title: 'Error', message: e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> executeProductsQuery(Query query) async {
    try {
      return runFirebaseSafely(() async{
        final tempProducts = await ProductRespository.to.executeProductsQuery(query);
        allProducts.assignAll(tempProducts);
        return tempProducts;
      });
    } catch (e) {
      print('Error fetching featured products: $e');
      RLoaders.errorSnackBar(title: 'Error', message: e.toString());
      return [];
    }
  }

  void assignAllProducts(List<ProductModel> products) {
    allProducts.assignAll(products);
  }

  void sortProducts(String value) {
    selectedSortOption.value = value;
    switch (value) {
      case 'Name':
        allProducts.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Higher Price':
        allProducts.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Lower Price':
        allProducts.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Sale':
        allProducts.sort((a, b) {
          if (b.salePrice > 0 && a.salePrice > 0) {
            return b.salePrice.compareTo(a.salePrice);
          } else if (b.salePrice > 0) {
            return 1; // b is on sale, a is not
          } else if (a.salePrice > 0) {
            return -1; // a is on sale, b is not
          } else {
            return 0; // neither are on sale
          }
        });
        break;
      case 'Newest':
        allProducts.sort((a, b) => b.date!.compareTo(a.date!));
        break;

      default:
        allProducts.sort((a, b) => b.stockQuantity.compareTo(a.stockQuantity));
        break;
    }
  }
}

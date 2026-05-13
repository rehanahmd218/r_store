import 'package:get/get.dart';
import 'package:r_store/data/repositories/brands/brand_repository.dart';
import 'package:r_store/features/shop/models/brand_model.dart';
import 'package:r_store/utils/popups/loaders.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.isRegistered<BrandController>()
      ? Get.find<BrandController>()
      : Get.put(BrandController());
  final brandRepository = Get.put(BrandRepository());
  RxList brandsList = [].obs;
  RxList featuredBrands = [].obs;
  // RxList featuredCategoryBrands = [].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBrands();
  }

  void fetchBrands() async {
    try {
      isLoading.value = true;
      final brands = await brandRepository.fetchBrands();
      brandsList.assignAll(brands);
      featuredBrands.assignAll(
        brands.where((brand) => brand.isFeatured == true).toList().take(4),
      );
      isLoading.value = false;
    } catch (e) {
      RLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  Future<List<BrandModel>> fetchFeaturedCategoryBrands({required String categoryId}) async {
    try {
      isLoading.value = true;
      final brands = await brandRepository.fetchCategoryBrands(
        categoryId: categoryId,
      );
      // featuredCategoryBrands.assignAll(brands);
      isLoading.value = false;
      return brands;
    } catch (e) {
      RLoaders.errorSnackBar(title: 'Error', message: e.toString());
      return [];
    }
  }

  
}

import 'package:get/get.dart';
import 'package:r_store/data/repositories/categories/category_repository.dart';
import 'package:r_store/features/shop/models/category_model.dart';
import 'package:r_store/utils/popups/loaders.dart';

class CategoriesController extends GetxController {
  static CategoriesController get instance => Get.isRegistered<CategoriesController>()
      ? Get.find<CategoriesController>()
      : Get.put(CategoriesController());

  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  RxBool isLoading = false.obs;

  final categoryRepository = Get.put(CategoryRepository());

  Future<void> fetchAllCategories() async {
    try {
      isLoading.value = true;
      final categories = await categoryRepository.getAllCategories();
      allCategories.assignAll(categories);
      featuredCategories.value = categories
          .where(
            (category) => category.isFeatured && category.parentId!.isEmpty,
          )
          .take(8)
          .toList();
      isLoading.value = false;
    } catch (e) {
      print('Error fetching categories: $e');
      RLoaders.errorSnackBar(title: 'Error', message: e.toString());
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchAllCategories();
  }

  Future<List<CategoryModel>> fetchSubCategories(String parentId) async {
    try {
      // await Future.delayed(const Duration(seconds: 10));
      final subCategories = await categoryRepository.getSubCategories(parentId);
      return subCategories;
    } catch (e) {
      print('Error fetching subcategories: $e');
      RLoaders.errorSnackBar(title: 'Error', message: e.toString());
      return [];
    }
  }
}

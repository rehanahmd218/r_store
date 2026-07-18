import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:r_store/common/requests/request_with_exception.dart';
import 'package:r_store/features/shop/models/category_model.dart';
import 'package:r_store/data/r_dummy_data.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get to => Get.find<CategoryRepository>();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final categories = await runFirebaseSafely(() async {
        final snapshot = await _db.collection('rehan_categories').get();
        return snapshot.docs.map((doc) => CategoryModel.fromJson(doc)).toList();
      });
      if (categories.isEmpty) return RDummyData.categories;
      return categories;
    } catch (e) {
      return RDummyData.categories;
    }
  }

  Future<List<CategoryModel>> getSubCategories(String parentId) async {
    try {
      final subCategories = await runFirebaseSafely(() async {
        final snapshot = await _db
            .collection('rehan_categories')
            .where('ParentId', isEqualTo: parentId)
            .get();
        return snapshot.docs.map((doc) => CategoryModel.fromJson(doc)).toList();
      });
      if (subCategories.isEmpty) {
        return RDummyData.categories.where((c) => c.parentId == parentId).toList();
      }
      return subCategories;
    } catch (e) {
      return RDummyData.categories.where((c) => c.parentId == parentId).toList();
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:r_store/common/requests/request_with_exception.dart';
import 'package:r_store/features/shop/models/category_model.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get to => Get.find<CategoryRepository>();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getAllCategories() async {
    return runFirebaseSafely(() async {
      final snapshot = await _db.collection('rehan_categories').get();
      return snapshot.docs.map((doc) => CategoryModel.fromJson(doc)).toList();
    });
  }

  Future<List<CategoryModel>> getSubCategories(String parentId) async {
    return runFirebaseSafely(() async {
      final snapshot = await _db
          .collection('rehan_categories')
          .where('ParentId', isEqualTo: parentId)
          .get();
      return snapshot.docs.map((doc) => CategoryModel.fromJson(doc)).toList();
    });
  }
}

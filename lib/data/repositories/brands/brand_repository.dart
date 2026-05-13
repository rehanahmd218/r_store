import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:r_store/common/requests/request_with_exception.dart';
import 'package:r_store/features/shop/models/brand_model.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find<BrandRepository>();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<BrandModel>> fetchBrands() async {
    return runFirebaseSafely(() async {
      final snapshot = await _db.collection('rehan_brands').get();
      return snapshot.docs
          .map((doc) => BrandModel.fromJson(doc.data()))
          .toList();
    });
  }

  Future<List<BrandModel>> fetchCategoryBrands({
    required String categoryId,
    int limit = 2,
  }) async {
    return runFirebaseSafely(() async {
      final snapshot = await _db.collection('rehan_brand_categories').where(
        'categoryId',
        isEqualTo: categoryId,
      ).limit(limit).get();

      final brandList = snapshot.docs
          .map((doc) => doc['brandId'] as String)
          .toList();
      return brandList.isNotEmpty
          ? await _db.collection('rehan_brands').where(
              FieldPath.documentId,
              whereIn: brandList,
            ).get().then((snapshot) {
              return snapshot.docs
                  .map((doc) => BrandModel.fromJson(doc.data()))
                  .toList();
            })
          : [];
    });
  }
}

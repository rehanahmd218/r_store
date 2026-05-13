import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:r_store/common/requests/request_with_exception.dart';
import 'package:r_store/features/shop/models/product_model.dart';

class ProductRespository extends GetxController {
  static ProductRespository get to => Get.find<ProductRespository>();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> fetchFeaturedProducts() async {
    return runFirebaseSafely(() async {
      final snapshot = await _db
          .collection('rehan_products')
          .where('isFeatured', isEqualTo: true)
          .limit(4)
          .get();
      return snapshot.docs.map((doc) => ProductModel.fromJson(doc)).toList();
    });
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    return runFirebaseSafely(() async {
      final snapshot = await _db
          .collection('rehan_products')
          .where('isFeatured', isEqualTo: true)
          .get();
      return snapshot.docs.map((doc) => ProductModel.fromJson(doc)).toList();
    });
  }

  Future<List<ProductModel>> executeProductsQuery(Query query) async {
    return runFirebaseSafely(() async {
      final snapshot = await query.get();

      return snapshot.docs
          .map(
            (doc) => ProductModel.fromQueryJson(
              doc as QueryDocumentSnapshot<Map<String, dynamic>>,
            ),
          )
          .toList();
    });
  }

  Future<List<ProductModel>> fetchAllBrandProducts({
    required String id,
    int limit = -1,
  }) async {
    return runFirebaseSafely(() async {
      final snapshot = await _db
          .collection('rehan_products')
          .where('brand.id', isEqualTo: id)
          .limit(limit > 0 ? limit : 1000)
          .get();
      return snapshot.docs.map((doc) => ProductModel.fromJson(doc)).toList();
    });
  }

  Future<List<ProductModel>> fetchAllFavoriteProducts(
    List<String> productIds,
  ) async {
    return runFirebaseSafely(() async {
      final snapshot = await _db
          .collection('rehan_products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();
      return snapshot.docs.map((doc) => ProductModel.fromJson(doc)).toList();
    });
  }

  Future<List<ProductModel>> fetchCategoryProducts({
    required String categoryId,
    int limit = -1,
  }) async {
    return runFirebaseSafely(() async {
      final snapshot = await _db
          .collection('rehan_products')
          .where('categoryId', isEqualTo: categoryId)
          .limit(limit > 0 ? limit : 1000)
          .get();
      return snapshot.docs.map((doc) => ProductModel.fromJson(doc)).toList();
    });
  }
}

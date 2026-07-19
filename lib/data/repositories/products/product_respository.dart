import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:r_store/common/requests/request_with_exception.dart';
import 'package:r_store/features/shop/models/product_model.dart';


class ProductRespository extends GetxController {
  static ProductRespository get to => Get.find<ProductRespository>();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> fetchFeaturedProducts() async {
    try {
      final products = await runFirebaseSafely(() async {
        final snapshot = await _db
            .collection('rehan_products')
            .where('isFeatured', isEqualTo: true)
            .limit(4)
            .get();
        return snapshot.docs.map((doc) => ProductModel.fromJson(doc)).toList();
      });
      return products;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      final products = await runFirebaseSafely(() async {
        final snapshot = await _db
            .collection('rehan_products')
            .where('isFeatured', isEqualTo: true)
            .get();
        return snapshot.docs.map((doc) => ProductModel.fromJson(doc)).toList();
      });
      return products;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> executeProductsQuery(Query query) async {
    try {
      final products = await runFirebaseSafely(() async {
        final snapshot = await query.get();

        return snapshot.docs
            .map(
              (doc) => ProductModel.fromQueryJson(
                doc as QueryDocumentSnapshot<Map<String, dynamic>>,
              ),
            )
            .toList();
      });
      return products;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> fetchAllBrandProducts({
    required String id,
    int limit = -1,
  }) async {
    try {
      final products = await runFirebaseSafely(() async {
        final snapshot = await _db
            .collection('rehan_products')
            .where('brand.id', isEqualTo: id)
            .limit(limit > 0 ? limit : 1000)
            .get();
        return snapshot.docs.map((doc) => ProductModel.fromJson(doc)).toList();
      });
      return products;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> fetchAllFavoriteProducts(
    List<String> productIds,
  ) async {
    try {
      final products = await runFirebaseSafely(() async {
        final snapshot = await _db
            .collection('rehan_products')
            .where(FieldPath.documentId, whereIn: productIds)
            .get();
        return snapshot.docs.map((doc) => ProductModel.fromJson(doc)).toList();
      });
      return products;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> fetchCategoryProducts({
    required String categoryId,
    int limit = -1,
  }) async {
    try {
      final products = await runFirebaseSafely(() async {
        final snapshot = await _db
            .collection('rehan_product_categories')
            .where('categoryId', isEqualTo: categoryId)
            .limit(limit > 0 ? limit : 1000)
            .get();
            
        final productIds = snapshot.docs
            .map((doc) => doc['productId'] as String)
            .toList();
            
        return productIds.isNotEmpty
            ? await _db.collection('rehan_products').where(
                FieldPath.documentId,
                whereIn: productIds,
              ).get().then((productSnap) {
                return productSnap.docs
                    .map((doc) => ProductModel.fromJson(doc))
                    .toList();
              })
            : <ProductModel>[];
      });

      return products;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}

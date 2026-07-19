import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:r_store/common/requests/request_with_exception.dart';
import 'package:r_store/features/shop/models/product_model.dart';
import 'package:r_store/data/r_dummy_data.dart';

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
      if (products.isEmpty) {
        return RDummyData.products.where((p) => p.isFeatured ?? false).take(4).toList();
      }
      return products;
    } catch (e) {
      return RDummyData.products.where((p) => p.isFeatured ?? false).take(4).toList();
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
      if (products.isEmpty) {
        return RDummyData.products.where((p) => p.isFeatured ?? false).toList();
      }
      return products;
    } catch (e) {
      return RDummyData.products.where((p) => p.isFeatured ?? false).toList();
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
      if (products.isEmpty) return RDummyData.products;
      return products;
    } catch (e) {
      return RDummyData.products;
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
      if (products.isEmpty) {
        return RDummyData.products
            .where((p) => p.brand?.id == id)
            .take(limit > 0 ? limit : 1000)
            .toList();
      }
      return products;
    } catch (e) {
      return RDummyData.products
          .where((p) => p.brand?.id == id)
          .take(limit > 0 ? limit : 1000)
          .toList();
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
      if (products.isEmpty) {
        return RDummyData.products
            .where((p) => productIds.contains(p.id))
            .toList();
      }
      return products;
    } catch (e) {
      return RDummyData.products
          .where((p) => productIds.contains(p.id))
          .toList();
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

      if (products.isEmpty) {
        final productIds = RDummyData.productCategories
            .where((pc) => pc.categoryId == categoryId)
            .take(limit > 0 ? limit : 1000)
            .map((pc) => pc.productId)
            .toList();
        return RDummyData.products
            .where((p) => productIds.contains(p.id))
            .toList();
      }
      return products;
    } catch (e) {
      final productIds = RDummyData.productCategories
          .where((pc) => pc.categoryId == categoryId)
          .take(limit > 0 ? limit : 1000)
          .map((pc) => pc.productId)
          .toList();
      return RDummyData.products
          .where((p) => productIds.contains(p.id))
          .toList();
    }
  }
}

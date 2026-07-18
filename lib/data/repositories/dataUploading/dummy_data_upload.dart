import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:r_store/common/requests/request_with_exception.dart';
import 'package:r_store/data/r_dummy_data.dart';
import 'package:r_store/data/services/firebase_storage_service.dart';
import 'package:r_store/features/shop/models/category_model.dart';
import 'package:r_store/features/shop/models/product_model.dart';
import 'package:r_store/features/shop/models/product_variation.dart';
import 'package:r_store/utils/popups/loaders.dart';



class DummyDataUpload extends GetxController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  static DummyDataUpload get instance => Get.find<DummyDataUpload>();

  final fireBaseStorageService = Get.put(RFirebaseStorageService());

  var uploadedItems = 0.obs;
  var totalItems = 0.obs;

  void showUploadDialog(String title, int total) {
    uploadedItems.value = 0;
    totalItems.value = total;
    Get.dialog(
      barrierDismissible: false,
      PopScope(
        canPop: false,
        child: Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Obx(
              () => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Uploading...', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Text(title),
                  const SizedBox(height: 20),
                  const CircularProgressIndicator(),
                  const SizedBox(height: 20),
                  Text('${uploadedItems.value} / ${totalItems.value} completed'),
                  const SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: totalItems.value > 0 ? uploadedItems.value / totalItems.value : 0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void closeUploadDialog() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }


  Future<void> uploadDummyData<T>({
    required String collectionName,
    required List<T> dummyData,
    String? imgField,
    String? firebaseImgPath,
  }) async {
    try {
      showUploadDialog('Uploading $collectionName...', dummyData.length);
      await runFirebaseSafely(() async {
        final Map<String, String> uploadedImgUrls = {};
        for (var element in dummyData) {
        try {
          final dataMap = (element as dynamic).toJson();
          if (imgField != null &&
              dataMap.containsKey(imgField) &&
              !uploadedImgUrls.containsKey(dataMap[imgField])) {
            final assetPath = dataMap[imgField] as String;
            final imgLink = await uploadSingleImg(assetPath, firebaseImgPath!);
            uploadedImgUrls[dataMap[imgField]] = imgLink ?? '';
            dataMap[imgField] = imgLink;
          }
          if (uploadedImgUrls.containsKey(dataMap[imgField])) {
            dataMap[imgField] = uploadedImgUrls[dataMap[imgField]]!;
          }
          if (collectionName == 'rehan_brands' ||
              collectionName == 'rehan_categories') {
            await _db
                .collection(collectionName)
                .doc(dataMap['id'])
                .set(dataMap);
          } else {
            await _db.collection(collectionName).add(dataMap);
          }
          uploadedItems.value++;
        } catch (e) {
          print('Error uploading data: $e');
          RLoaders.errorSnackBar(
            title: 'Error',
            message: 'Failed to upload some data: $e',
          );
        }
      }
      closeUploadDialog();
      RLoaders.successSnackBar(
        title: 'Success',
        message: '$collectionName Uploaded Successfully',
      );
    });
    } catch (e) {
      closeUploadDialog();
      RLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  Future<void> uploadBannersData() async {
    final allBanners = RDummyData.banners;
    await uploadDummyData(
      collectionName: 'rehan_banners',
      dummyData: allBanners,
      imgField: 'imgUrl',
      firebaseImgPath: 'Rehan_Pictures/Banners',
    );
  }

  Future<String> uploadSingleImg(
    String assetPath,
    String firebaseImgPath,
  ) async {
    return await runFirebaseSafely(() async {
      // Get image data from assets instead of creating XFile
      final imageData = await fireBaseStorageService.getImgData(assetPath);
      if (imageData != null) {
        // Extract filename from asset path
        final fileName = assetPath.split('/').last;

        // Upload using image data instead of file
        final imgLink = await fireBaseStorageService.uploadImgData(
          firebaseImgPath!,
          fileName,
          imageData,
        );
        return imgLink ?? assetPath;
      } else {
        return assetPath;
      }
    });
  }

  Future<void> uploadCategoriesData() async {
    List<CategoryModel> allCategories = RDummyData.categories;
    // allCategories = [allCategories[0]];
    await uploadDummyData(
      collectionName: 'rehan_categories',
      dummyData: allCategories,
      imgField: 'imgUrl',
      firebaseImgPath: 'Rehan_Pictures/Categories',
    );
  }

  Future<void> uploadProductsData() async {
    var allProducts = RDummyData.products;
    // allProducts = [allProducts[0]];
    final String fireBaseImgPath = 'Rehan_Pictures/Products';
    Map<String, String> uploadedImgUrls = {};

    try {
      showUploadDialog('Uploading Products...', allProducts.length);
      await runFirebaseSafely(() async {
        for (ProductModel product in allProducts) {
        // LinearProgressIndicator(
        //   value: allProducts.indexOf(product) / allProducts.length,
        // );

        try {
          final Map<String, String> uploadedImgUrls = {};

          final dataMap = (product as dynamic).toJson();

          /// Uploading thumbnail

          try {
            final assetPath = dataMap['thumbnail'] as String;
            if (!uploadedImgUrls.containsKey(assetPath)) {
              final imgLink = await uploadSingleImg(assetPath, fireBaseImgPath);
              dataMap['thumbnail'] = imgLink;
              uploadedImgUrls[assetPath] = imgLink;
            } else {
              dataMap['thumbnail'] = uploadedImgUrls[assetPath];
            }
          } catch (e) {
            print('Error uploading data: $e');
            RLoaders.errorSnackBar(
              title: 'Error',
              message: 'Failed to upload Thumbnail: $e',
            );
          }

          // Upload Brand Image
          try {
            final assetPath = dataMap['brand']['image'] as String;

            if (!uploadedImgUrls.containsKey(assetPath)) {
              final imgLink = await uploadSingleImg(
                assetPath,
                'Rehan_Pictures/Brands',
              );
              dataMap['brand']['image'] = imgLink;
              uploadedImgUrls[assetPath] = imgLink;
            } else {
              dataMap['brand']['image'] = uploadedImgUrls[assetPath];
            }
          } catch (e) {
            print('Error uploading data: $e');
            RLoaders.errorSnackBar(
              title: 'Error',
              message: 'Failed to upload Brand Image: $e',
            );
          }

          /// Uploading images
          final List<String>? allProductImages = dataMap['images'];

          if (!(allProductImages == null || allProductImages.isEmpty)) {
            try {
              for (var i = 0; i < allProductImages.length; i++) {
                final assetPath = allProductImages[i];
                if (assetPath == null || assetPath.isEmpty) continue;

                if (uploadedImgUrls.containsKey(assetPath)) {
                  dataMap['images'][i] = uploadedImgUrls[assetPath];
                  continue;
                }
                final imgLink = await uploadSingleImg(
                  assetPath,
                  fireBaseImgPath,
                );
                dataMap['images'][i] = imgLink;
                uploadedImgUrls[assetPath] = imgLink;
              }
            } catch (e) {
              print('Error uploading data: $e');
              RLoaders.errorSnackBar(
                title: 'Error',
                message: 'Failed to upload All Images: $e',
              );
            }
          }

          if (dataMap['productType'] == ProductType.variable.name &&
              dataMap['variations'] != null) {
            /// Uploading images
            final allVariationImgs = dataMap['variations'];

            try {
              for (var i = 0; i < allVariationImgs.length; i++) {
                final assetPath = allVariationImgs[i]['image'] as String;
                if (assetPath.isEmpty) continue;

                if (uploadedImgUrls.containsKey(assetPath)) {
                  allVariationImgs[i]['image'] = uploadedImgUrls[assetPath];
                  continue;
                }
                final imgLink = await uploadSingleImg(
                  assetPath,
                  fireBaseImgPath,
                );
                allVariationImgs[i]['image'] = imgLink;
                uploadedImgUrls[assetPath] = imgLink;
              }
            } catch (e) {
              print('Error uploading data: $e');
              RLoaders.errorSnackBar(
                title: 'Error',
                message: 'Failed to upload All Images: $e',
              );
            }
          }

          await _db.collection('rehan_products').doc(product.id).set(dataMap);
          uploadedItems.value++;
        } catch (e) {
          print('Error uploading data: $e');
          RLoaders.errorSnackBar(
            title: 'Error',
            message: 'Failed to upload some data: $e',
          );
        }
      }
      closeUploadDialog();
      RLoaders.successSnackBar(
        title: 'Success',
        message: 'All Products Uploaded Successfully',
      );
    });
    } catch (e) {
      closeUploadDialog();
      RLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  Future<void> uploadFireStoreData(
    List<Map<String, dynamic>> dataList,
    String collectionName,
  ) async {
    try {
      showUploadDialog('Uploading $collectionName...', dataList.length);
      await runFirebaseSafely(() async {
        for (var dataMap in dataList) {
          await _db.collection(collectionName).add(dataMap);
          uploadedItems.value++;
        }
        closeUploadDialog();
        RLoaders.successSnackBar(
          title: 'Success',
          message: 'Data Uploaded Successfully',
        );
      });
    } catch (e) {
      closeUploadDialog();
      RLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  Future<void> uploadDummyBrandCategories() async {

    await uploadFireStoreData(
      RDummyData.brandCategory.map((category) => category.toJson()).toList(),
      'rehan_brand_categories',
    );
  }

  Future<void> uploadDummyProductCategories() async {
    await uploadFireStoreData(
      RDummyData.productCategories
          .map((category) => category.toJson())
          .toList(),
      'rehan_product_categories',
    );
  }
}

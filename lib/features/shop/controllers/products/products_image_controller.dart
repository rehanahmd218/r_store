import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_store/features/shop/models/product_model.dart';
import 'package:r_store/utils/constants/sizes.dart';

class ProductsImageController extends GetxController {
  static ProductsImageController get instance => Get.isRegistered<ProductsImageController>()
      ? Get.find<ProductsImageController>()
      : Get.put(ProductsImageController());

  RxString selectedImage = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  // void setImageUrl(String url){
  //   imageUrl.value = url;
  // }

  List<String> getAllImagesAgainstProduct(ProductModel product) {
    selectedImage.value = product.thumbnail;
    final Set<String> images = {};
    if (product.images != null || product.images!.isNotEmpty) {
      images.addAll(product.images!);
    }

    images.add(product.thumbnail);

    if (product.variations != null && product.variations!.isNotEmpty) {
      for (var variation in product.variations!) {
        images.add(variation.image);
      }
    }

    return images.toList();
  }

  void showFullImgDialog(String imgUrl) {

    Get.dialog(
      Dialog.fullscreen(
        child: Padding(

          padding: const EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CachedNetworkImage(imageUrl: imgUrl, fit: BoxFit.contain),
              const SizedBox(height: RSizes.defaultSpace),
              Align(
                alignment: Alignment.bottomCenter,

                child: SizedBox(
                
                  width: 150,
                
                  child: OutlinedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey),
                    ),
                    child: const Text('Close'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 
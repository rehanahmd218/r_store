import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:r_store/common/widgets/custome_shapes/containers/circular_container.dart';
import 'package:r_store/common/widgets/images/rounded_image.dart';
import 'package:r_store/common/widgets/loaders/shimmer.dart';
import 'package:r_store/features/shop/controllers/banner_controller.dart';
import 'package:r_store/features/shop/controllers/home_controller.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/sizes.dart';

class RPromoSlider extends StatelessWidget {
  const RPromoSlider({super.key});

  // final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final bannerController = Get.put(BannerController());
    return Obx(() {
      if (bannerController.isLoading.value) {
        return Center(
          child: RShimmerEffect(
            height: 190,
            width: MediaQuery.sizeOf(context).width * 0.90,
          ),
        );
      }
      if (bannerController.bannersList.isEmpty) {
        return Text(
          'No Banners Available',
          style: Theme.of(context).textTheme.titleMedium,
        );
      }

      return Column(
        children: [
          CarouselSlider(
            items: bannerController.bannersList
                .map(
                  (value) => RRoundedImage(
                    width: MediaQuery.sizeOf(context).width * 0.90,
                    imgUrl: value.imgUrl,
                    applyImgRadius: true,
                    borderRadius: RSizes.cardRadiusMd,
                    fit: BoxFit.cover,
                    isNetworkImg: true,
                    onPressed: () {
                      Get.toNamed(value.targetScreen);
                    },
                  ),
                )
                .toList(),

            options: CarouselOptions(
              viewportFraction: 1,
              // autoPlay: true,/
              onPageChanged: (index, reason) =>
                  bannerController.updatePromoIndex(index),
            ),
          ),
          const SizedBox(height: RSizes.spaceBtwItems),
          Center(
            child: Obx(
              () => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < bannerController.bannersList.length; i++)
                    RCircularContainer(
                      height: 4,
                      color: bannerController.promoIndex.value == i
                          ? RColors.primary
                          : RColors.darkGrey,
                      width: 20,
                      margin: const EdgeInsets.only(
                        right: RSizes.spaceBtwItems,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/common/prefferd_sized/appbar.dart';
import 'package:r_store/common/widgets/custome_shapes/curved_edges/curved_edge_widget.dart';
import 'package:r_store/common/widgets/icons/circular_icon.dart';
import 'package:r_store/common/widgets/images/rounded_image.dart';
import 'package:r_store/common/widgets/products/favourite_icon.dart';
import 'package:r_store/features/shop/controllers/products/products_image_controller.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/image_strings.dart';
import 'package:r_store/utils/constants/sizes.dart';

class RProductImageSlider extends StatelessWidget {
  const RProductImageSlider({
    super.key,
    required this.isDark,
    required this.imgList,
    required this.productId,
  });

  final bool isDark;
  final List<String> imgList;
  final String productId;
  @override
  Widget build(BuildContext context) {
    final controller = ProductsImageController.instance;
    return RCurvedEdgeWidget(
      child: Container(
        color: isDark ? RColors.darkerGrey : RColors.grey,
        child: Stack(
          children: [
            GestureDetector(
              onTap: (){
                controller.showFullImgDialog(controller.selectedImage.value);
              },
              child: SizedBox(
                height: 360,
                child: Padding(
                  padding: EdgeInsets.all(RSizes.borderRadiusLg),
                  child: Obx(() {
                    final image = controller.selectedImage.value;
                    return image.startsWith('http')
                        ? CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: image,
                          )
                        : Image(
                            image: AssetImage(image),
                            fit: BoxFit.cover,
                          );
                  }),
                ),
              ),
            ),

            Positioned(
              bottom: 30,
              right: 0,
              left: RSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: imgList.length,
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => Obx(() {
                    final isSelected =
                        controller.selectedImage.value == imgList[index];
                    return RRoundedImage(
                      onPressed: () {
                        controller.selectedImage.value = imgList[index];
                      },
                      imgUrl: imgList[index],
                      bgColor: isDark ? RColors.backgroundDark : RColors.white,
                      width: 80,
                      border: Border.all(
                        color: isSelected
                            ? RColors.buttonPrimary
                            : Colors.transparent,
                      ),
                    );
                  }),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: RSizes.spaceBtwItems),
                  shrinkWrap: true,
                ),
              ),
            ),

            RAppBar(
              showBackButton: true,
              actions: [
                RFavouriteIcon(productId: productId),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

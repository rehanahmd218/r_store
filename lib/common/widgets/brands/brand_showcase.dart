import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_store/common/widgets/brands/brand_card.dart';
import 'package:r_store/common/widgets/custome_shapes/containers/rounded_container.dart';
import 'package:r_store/features/shop/controllers/products/products_controller.dart';
import 'package:r_store/features/shop/models/brand_model.dart';
import 'package:r_store/features/shop/screens/brand/alll_brand_products.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/sizes.dart';

class RBrandShowCase extends StatelessWidget {
  const RBrandShowCase({
    super.key,
    required this.isDark,
    required this.images,
    required this.brand,
  });
  final BrandModel brand;
  final bool isDark;
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => BrandProductScreen(
            title: brand.name,
            brandFuture: ProductsController.instance.fetchAllBrandProducts(
              brandId: brand.id,
            ),
            brand: brand,
          ),
        );
      },
      child: RRoundedContainer(
        showBorder: true,
        margin: EdgeInsets.only(top: RSizes.sm),
        bgColor: Colors.transparent,
        padding: const EdgeInsets.all(RSizes.sm),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            RBrandCard(showBorder: false, onTap: null, brand: brand),
            Row(
              children: images.map((element) {
                return brandShowCaseImage(element, context);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Expanded brandShowCaseImage(String image, context) {
    return Expanded(
      child: RRoundedContainer(
        height: 100,
        bgColor: isDark ? RColors.darkerGrey : RColors.containerLight,
        margin: const EdgeInsets.only(right: RSizes.sm),
        padding: const EdgeInsets.all(RSizes.md),
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: image,
          placeholder: (context, url) {
            return const Center(child: CircularProgressIndicator());
          },
          errorWidget: (context, url, error) {
            return const Icon(Icons.error);
          },
        ),
      ),
    );
  }
}

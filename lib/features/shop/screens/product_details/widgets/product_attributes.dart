import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:r_store/common/widgets/chips/choice_chip.dart';
import 'package:r_store/common/widgets/custome_shapes/containers/rounded_container.dart';
import 'package:r_store/common/widgets/products/product_text/product_price_text.dart';
import 'package:r_store/common/widgets/texts/section_heading.dart';
import 'package:r_store/features/shop/controllers/products/products_controller.dart';
import 'package:r_store/features/shop/controllers/products/variation_controller.dart';
import 'package:r_store/features/shop/models/product_model.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/helpers/helper_functions.dart';

class RProductAttributes extends StatelessWidget {
  const RProductAttributes({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    // final controller = ProductsController.instance;
    // final productPrice = controller.getProductPrice(product);
    // final stockStatus = controller.getProductStockStatus(product);

    final variationController = VariationController.instance;

    return Obx(
      () => Column(
        children: [
          // Product Short Description + Price Details Card
          if (variationController.selectedVariation.value.id.isNotEmpty)
            RRoundedContainer(
              bgColor: isDark ? RColors.darkerGrey : RColors.grey,
              padding: EdgeInsets.all(RSizes.defaultSpace / 2),
              child: Column(
                children: [
                  Row(
                    children: [
                      RSectionHeading(
                        title: 'Variation',
                        showActionButton: false,
                      ),
                      const SizedBox(width: RSizes.spaceBtwSections),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            spacing: RSizes.sm,
                            children: [
                              Text(
                                'Price:',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              if (variationController
                                      .selectedVariation
                                      .value
                                      .salePrice >
                                  0)
                                RProductPriceText(
                                  price: variationController
                                      .selectedVariation
                                      .value
                                      .price
                                      .toString(),
                                  lineThrough: true,
                                  isLarge: false,
                                ),

                              RProductPriceText(
                                price: variationController
                                    .selectedVariation
                                    .value
                                    .salePrice
                                    .toString(),
                                lineThrough: false,
                                isLarge: true,
                              ),
                            ],
                          ),
                          Row(
                            spacing: RSizes.sm,
                            children: [
                              Text(
                                'Stock:',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(
                                variationController.variationStockStatus.value,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: RSizes.spaceBtwItems / 2),
                  Text(
                    product.description ?? '',
                    maxLines: 4,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),

          const SizedBox(height: RSizes.spaceBtwItems),
          Column(
            children: [
              ...product.attributes!.map((attribute) {
                return Column(
                  children: [
                    if (product.variations != null &&
                        product.variations!.isNotEmpty)
                      Obx(
                        () => Wrap(
                          spacing: RSizes.sm,
                          children: [
                            RSectionHeading(title: attribute.name!),
                            const SizedBox(height: RSizes.spaceBtwItems / 2),

                            ...attribute.values!.map((value) {
                              final isselected =
                                  variationController
                                      .selectedAttributes[attribute.name] ==
                                  value;
                              final available = variationController
                                  .getAttributesAvailabilityInVariation(
                                    product.variations ?? [],
                                    attribute.name!,
                                  )
                                  .contains(value);

                             

                              return RChoiceChip(
                                label: value,
                                isSelected: isselected,
                                onSelected: available
                                    ? (selected) {
                                        if (selected && available) {
                                          variationController
                                              .onAttributeSelected(
                                                product,
                                                attribute.name!,
                                                value,
                                              );
                                        }
                                      }
                                    : null,
                              );
                            }),
                          ],
                        ),
                      ),
                  ],
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}

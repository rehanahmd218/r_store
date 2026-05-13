import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/common/widgets/layout/grid_layout.dart';
import 'package:r_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:r_store/features/shop/controllers/products/all_products_controller.dart';
import 'package:r_store/features/shop/models/product_model.dart';
import 'package:r_store/utils/constants/sizes.dart';

class RSortableProducts extends StatelessWidget {
  const RSortableProducts({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final allProductsController = AllProductsController.instance;
    return Column(
      children: [
        DropdownButtonFormField(
          initialValue: 'Popularity',
          decoration: const InputDecoration(
            labelText: 'Sort by',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Iconsax.sort),
          ),
          onChanged: (value) {
            allProductsController.sortProducts(value!);
          },

          items:
              [
                    'Name',
                    'Higher Price',
                    'Lower Price',
                    'Sale',
                    'Newest',
                    'Popularity',
                  ]
                  .map(
                    (element) =>
                        DropdownMenuItem(value: element, child: Text(element)),
                  )
                  .toList(),
        ),
        const SizedBox(height: RSizes.spaceBtwSections),

        RGridLayout(
          itemCount: products.length,
          itemBuilder: (_, index) =>
              RProductCardVertical(product: products[index]),
        ),
      ],
    );
  }
}

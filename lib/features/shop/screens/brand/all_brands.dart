import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_store/common/prefferd_sized/appbar.dart';
import 'package:r_store/common/widgets/brands/brand_card.dart';
import 'package:r_store/common/widgets/layout/grid_layout.dart';
import 'package:r_store/common/widgets/texts/section_heading.dart';
import 'package:r_store/features/shop/controllers/brand_controller.dart';
import 'package:r_store/features/shop/controllers/products/products_controller.dart';
import 'package:r_store/features/shop/models/brand_model.dart';
import 'package:r_store/features/shop/screens/all_products/all_products.dart';
import 'package:r_store/features/shop/screens/brand/alll_brand_products.dart';
import 'package:r_store/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: RAppBar(
        title: Text('Brand', style: Theme.of(context).textTheme.headlineSmall),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            children: [
              RSectionHeading(title: 'Brands', showActionButton: false),
              Obx(()=>
                 RGridLayout(
                  mainAxisExtent: 80,
                  itemCount: brandController.brandsList.length,
                  itemBuilder: (_, index) {
                    final brand = brandController.brandsList[index];
                    final brandFuture = ProductsController.instance.fetchAllBrandProducts(brandId: brand.id);
                    return RBrandCard(
                      showBorder: true,
                      onTap: () {
                        Get.to(() => BrandProductScreen(
                          title: brand.name,
                          brandFuture: brandFuture,
                          brand: brand,
                        ));
                      },
                      brand: brand,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

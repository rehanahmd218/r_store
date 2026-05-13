import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:r_store/common/prefferd_sized/appbar.dart';
import 'package:r_store/common/widgets/brands/brand_card.dart';
import 'package:r_store/common/widgets/loaders/vertical_product_shimmer.dart';
import 'package:r_store/common/widgets/sortable/sortable_products.dart';
import 'package:r_store/features/shop/models/product_model.dart';
import 'package:r_store/utils/constants/sizes.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({
    super.key,
    required this.title,
    this.productsQuery,
    required this.productsFuture,
  });

  final Query? productsQuery;

  final Future<List<ProductModel>> productsFuture;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RAppBar(
        title: Text(
          'All Products',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(RSizes.defaultSpace),
          child: FutureBuilder(
            future: productsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: RProductCardVerticalShimmer());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No products found.'));
              } else {
                final products = snapshot.data!;
                return RSortableProducts(
                  products: products,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

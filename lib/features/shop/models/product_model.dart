import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:r_store/features/shop/models/brand_model.dart';
import 'package:r_store/features/shop/models/product_attributes.dart';
import 'package:r_store/features/shop/models/product_variation.dart';
import 'package:r_store/utils/constants/image_strings.dart';

class ProductModel {
  final String id;
  final String? categoryId;
  final String? description;
  final String title;
  final String? sku;
  final String productType;
  final List<String>? images;
  final double price;
  final double stockQuantity;
  final String thumbnail;
  final bool? isFeatured;
  final double salePrice;
  DateTime? date;

  final List<ProductAttributesModel>? attributes;
  final List<ProductVariationModel>? variations;
  final BrandModel? brand;

  ProductModel({
    required this.id,
    this.categoryId,
    this.description,
    required this.title,
    this.sku,
    required this.productType,
    this.images,
    required this.price,
    required this.stockQuantity,
    required this.thumbnail,
    this.isFeatured,
    this.salePrice = 0.0,
    this.date,
    this.attributes,
    this.variations,
    this.brand,
  });

   ProductModel.empty()
      : id = '',
        categoryId = '',
        description = '',
        title = '',
        sku = '',
        productType = '',
        images = [],
        price = 0.0,
        stockQuantity = 0.0,
        thumbnail = '',
        isFeatured = false,
        salePrice = 0.0,
        date = null,
        attributes = [],
        variations = [],
        brand = null;

  toJson() {
    return {
      'id': id,
      'categoryId': categoryId,
      'description': description,
      'title': title,
      'sku': sku,
      'productType': productType,
      'images': images,
      'price': price,
      'stockQuantity': stockQuantity,
      'thumbnail': thumbnail,
      'isFeatured': isFeatured,
      'salePrice': salePrice,
      'date': date?.toIso8601String(),
      'attributes': attributes != null
          ? attributes?.map((e) => e.toJson()).toList()
          : [],
      'variations': variations != null
          ? variations?.map((e) => e.toJson()).toList()
          : [],
      'brand': brand?.toJson(),
    };
  }


  factory ProductModel.fromJson(DocumentSnapshot<Map<String,dynamic>> document){
    final data = document.data();
    if(data == null){
      return ProductModel.empty();
    }
    return ProductModel(
      id: document.id,
      sku: data['sku'] as String?,
      title: data['title'] as String,
      stockQuantity: (data['stockQuantity'] as num?)?.toDouble() ?? 0.0,
      isFeatured: data['isFeatured'] as bool?,
      price: (data['price'] as num?)?.toDouble() ?? 0.0,
      salePrice: (data['salePrice'] as num?)?.toDouble() ?? 0.0,
      thumbnail: data['thumbnail'] as String,
      categoryId: data['categoryId'] as String?,
      description: data['description'] as String?,
      productType: data['productType'] as String,
      brand: data['brand'] != null
          ? BrandModel.fromJson(data['brand'] as Map<String, dynamic>)
          : null,
      images: List<String>.from(data['images'] ?? []),
      date: (data['date'] as Timestamp?)?.toDate(),
      attributes: (data['attributes'] as List<dynamic>?)
          ?.map((e) => ProductAttributesModel.fromJson(e))
          .toList(),
      variations: (data['variations'] as List<dynamic>?)
          ?.map((e) => ProductVariationModel.fromJson(e))
          .toList(),
    
    );
  }
  factory ProductModel.fromQueryJson(QueryDocumentSnapshot<Map<String,dynamic>> document){
    final data = document.data();
    if(data == null){
      return ProductModel.empty();
    }
    return ProductModel(
      id: document.id,
      sku: data['sku'] as String?,
      title: data['title'] as String,
      stockQuantity: (data['stockQuantity'] as num?)?.toDouble() ?? 0.0,
      isFeatured: data['isFeatured'] as bool?,
      price: (data['price'] as num?)?.toDouble() ?? 0.0,
      salePrice: (data['salePrice'] as num?)?.toDouble() ?? 0.0,
      thumbnail: data['thumbnail'] as String,
      categoryId: data['categoryId'] as String?,
      description: data['description'] as String?,
      productType: data['productType'] as String,
      brand: data['brand'] != null
          ? BrandModel.fromJson(data['brand'] as Map<String, dynamic>)
          : null,
      images: List<String>.from(data['images'] ?? []),
      date: (data['date'] as Timestamp?)?.toDate(),
      attributes: (data['attributes'] as List<dynamic>?)
          ?.map((e) => ProductAttributesModel.fromJson(e))
          .toList(),
      variations: (data['variations'] as List<dynamic>?)
          ?.map((e) => ProductVariationModel.fromJson(e))
          .toList(),
    
    );
  }
}

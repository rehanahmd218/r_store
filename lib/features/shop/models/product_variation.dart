class ProductVariationModel {
  final String id;
  final String sku;
  final String image;
  final String? description;
  final double price;
  final double salePrice;
  final double stockQuantity;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stockQuantity = 0.0,
    required this.attributeValues,
  });

  static ProductVariationModel empty() => ProductVariationModel(id: '', attributeValues: {});


  toJson(){
    return {
      'id': id,
      'sku': sku,
      'image': image,
      'description': description,
      'price': price,
      'salePrice': salePrice,
      'stockQuantity': stockQuantity,
      'attributeValues': attributeValues,
    };
  }


  factory ProductVariationModel.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) {
      return ProductVariationModel.empty();
    }

    return ProductVariationModel(
      id: json.containsKey('id') ? json['id'] : '',
      sku: json.containsKey('sku') ? json['sku'] : '',
      image: json.containsKey('image') ? json['image'] : '',
      description: json.containsKey('description') ? json['description'] : '',
      price: json.containsKey('price') ? (json['price'] as num).toDouble() : 0.0,
      salePrice: json.containsKey('salePrice') ? (json['salePrice'] as num).toDouble() : 0.0,
      stockQuantity: json.containsKey('stockQuantity') ? (json['stockQuantity'] as num).toDouble() : 0.0,
      attributeValues: json.containsKey('attributeValues')
          ? Map<String, String>.from(json['attributeValues'])
          : {},
    );
  }
}

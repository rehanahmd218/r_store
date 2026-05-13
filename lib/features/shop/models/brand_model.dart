class BrandModel {
  final String id;
  final String name;
  final String image;
  final bool isFeatured;
  int? productsCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured = false,
    this.productsCount,
  });

  toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'isFeatured': isFeatured,
      'productsCount': productsCount,
    };
  }

  static BrandModel empty() {
    return BrandModel(
      id: '',
      name: '',
      image: '',
      isFeatured: false,
      productsCount: 0,
    );
  }

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      isFeatured: json['isFeatured'] as bool,
      productsCount: json['productsCount'] as int?,
    );
  }
}

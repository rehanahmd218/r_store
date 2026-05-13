class BrandCategoryModel {
  String brandId;
  String categoryId;

  BrandCategoryModel({required this.brandId, required this.categoryId});

  Map<String, dynamic> toJson() {
    return {'brandId': brandId, 'categoryId': categoryId};
  }

  factory BrandCategoryModel.fromJson(Map<String, dynamic> json) {
    return BrandCategoryModel(
      brandId: json['brandId'] as String,
      categoryId: json['categoryId'] as String,
    );
  }
}
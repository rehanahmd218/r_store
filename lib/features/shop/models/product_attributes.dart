class ProductAttributesModel {
  String? name;
  final List<String>? values;

  ProductAttributesModel({this.name, this.values});

  toJson() {
    return {'name': name, 'values': values};
  }

  factory ProductAttributesModel.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) {
      return ProductAttributesModel();
    }

    return ProductAttributesModel(
      name: json.containsKey('name') ? json['name'] : '',
      values: List<String>.from(json['values'] ?? []),
    );
  }
}

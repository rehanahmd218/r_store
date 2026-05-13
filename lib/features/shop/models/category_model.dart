import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String id;
  final String name;
  final String imageUrl;
  final bool isFeatured;
  final String? parentId;

  CategoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isFeatured,
    this.parentId
  });


  static CategoryModel empty(){
    return CategoryModel(
      id: '',
      name: '',
      imageUrl: '',
      isFeatured: false,
      parentId: ''
    );
  }

  factory CategoryModel.fromJson(DocumentSnapshot<Map<String, dynamic>> json) {
    final data = json.data();

    if (data == null) {
      return CategoryModel.empty();
    }
    return CategoryModel(
      id: json.id,
      name: data['Name'] as String,
      imageUrl: data['imgUrl'] as String,
      isFeatured: data['IsFeatured'] as bool,
      parentId: data['ParentId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'Name': name,
      'imgUrl': imageUrl,
      'IsFeatured': isFeatured,
      'ParentId': parentId,
    };
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  final String imgUrl;
  final String targetScreen;
  final bool isActive;

  BannerModel({
    required this.imgUrl,
    required this.targetScreen,
    required this.isActive,
  });

  static BannerModel empty() {
    return BannerModel(imgUrl: '', targetScreen: '', isActive: false);
  }

  Map<String, dynamic> toJson() {
    return {
      'imgUrl': imgUrl,
      'targetScreen': targetScreen,
      'isActive': isActive,
    };
  }

  factory BannerModel.fromJson(DocumentSnapshot<Map<String, dynamic>> json) {
    final data = json.data();
    if (data == null) {
      return BannerModel.empty();
    }
    return BannerModel(
      imgUrl: data['imgUrl'] as String,
      targetScreen: data['targetScreen'] as String,
      isActive: data['isActive'] as bool,
    );
  }
}

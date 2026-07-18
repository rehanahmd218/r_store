import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:r_store/common/requests/request_with_exception.dart';
import 'package:r_store/features/shop/models/banner_model.dart';
import 'package:get/get.dart';
import 'package:r_store/data/r_dummy_data.dart';
class BannerRespository extends GetxController{
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  static BannerRespository get instance => Get.find();


  Future<List<BannerModel>> fetchBanners() async {
    try {
      final banners = await runFirebaseSafely(() async {
        final snapshot = await _db.collection('rehan_banners').get();
        return snapshot.docs
            .map((doc) => BannerModel.fromJson(doc))
            .where((banner) => banner.isActive).toList();
      });
      if (banners.isEmpty) return RDummyData.banners;
      return banners;
    } catch (e) {
      return RDummyData.banners;
    }
  }

  
}

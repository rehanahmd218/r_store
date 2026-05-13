import 'package:get/get.dart';

import 'package:r_store/data/repositories/banner/banner_respository.dart';
import 'package:r_store/features/shop/models/banner_model.dart';
import 'package:r_store/utils/popups/loaders.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.isRegistered<BannerController>()
      ? Get.find<BannerController>()
      : Get.put(BannerController());
  RxInt promoIndex = 0.obs;

  final bannerRespository = Get.put(BannerRespository());
  RxList<BannerModel> bannersList = <BannerModel>[].obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    fetchBanners();
  }

  void updatePromoIndex(int index) {
    promoIndex.value = index;
  }

  void fetchBanners() async {
    try {
      isLoading.value = true;
      final banners = await bannerRespository.fetchBanners();
      bannersList.assignAll(banners);
      isLoading.value = false;
    } catch (e) {
      RLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}

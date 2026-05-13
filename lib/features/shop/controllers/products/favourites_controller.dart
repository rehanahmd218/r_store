import 'dart:convert';

import 'package:get/get.dart';
import 'package:r_store/utils/local_storage/storage_utility.dart';
import 'package:r_store/utils/popups/loaders.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.isRegistered<FavouritesController>()
      ? Get.find<FavouritesController>()
      : Get.put(FavouritesController());
  RxMap<String, bool> favourites = <String, bool>{}.obs;
  RLocalStorage? _localStorage;
  final String _favouritesKey = 'favourites';

  @override
  void onInit() {
    super.onInit();
    _localStorage = RLocalStorage();
    loadFavouritesFromLocalStorage();
  }

  void loadFavouritesFromLocalStorage() {
    final favString = _localStorage!.readData<String>(_favouritesKey);
    if (favString != null) {
      final Map<String, dynamic> favMap = jsonDecode(favString);
      favourites.value = favMap.map(
        (key, value) => MapEntry(key, value as bool),
      );
    }
  }

  void toggleFavourite(String productId) {
    if (favourites.containsKey(productId)) {
      final value = favourites[productId] ?? false;
      if (value) {
        RLoaders.customToast(message: 'Product removed from favourites');
        favourites.remove(productId);
      } else {
        RLoaders.customToast(message: 'Product added to favourites');
        favourites[productId] = !value;
      }
    } else {
      RLoaders.customToast(message: 'Product added to favourites');
      favourites[productId] = true;
    }
    favourites.refresh();
    saveFavouritesToLocalStorage();
  }

  void saveFavouritesToLocalStorage() {
    final favString = jsonEncode(favourites);
    _localStorage!.saveData<String>(_favouritesKey, favString);
  }

  bool isFavourite(String productId) {
    return favourites[productId] ?? false;
  }
}

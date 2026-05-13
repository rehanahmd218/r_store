import 'package:get_storage/get_storage.dart';
import 'package:r_store/utils/popups/loaders.dart';

class RLocalStorage {
  static RLocalStorage? _instance;
  late final GetStorage _storage;

  RLocalStorage._internal();

  factory RLocalStorage() {
    _instance ??= RLocalStorage._internal();
    return _instance!;
  }

  static Future<void> init(String uid) async {
    try {
      await GetStorage.init(uid);
      // print('After Initialization of GetStorage with UID: $uid');
    } catch (e) {
      print('Error initializing GetStorage with UID $uid: $e');
      RLoaders.errorSnackBar(title: 'Storage Error', message: 'Failed to initialize local storage.');
      return;
    }
    _instance = RLocalStorage._internal();
    _instance!._storage = GetStorage(uid);
    // print('Initialized GetStorage with UID: $uid');
  }

  // Generic method to save date
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // Generic method to read data
  T? readData<T>(String key) {
    print('Storage variable $_storage');
    return _storage.read<T>(key);
  }

  // Generic method to delete data
  Future<void> deleteData(String key) async {
    await _storage.remove(key);
  }

  // Clear all Data in Storage
  Future<void> clearAllData() async {
    await _storage.erase();
  }
}

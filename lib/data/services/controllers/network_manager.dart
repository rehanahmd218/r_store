import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:r_store/utils/popups/loaders.dart';

class NetworkManager extends GetxController{

  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();

  // late StreamSubscription<List<ConnectivityResult>> _connectionSubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
     _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

    void _updateConnectionStatus(List<ConnectivityResult> results) {
    // Use the first result as the primary connection status
    final result = results.isNotEmpty ? results.first : ConnectivityResult.none;
    _connectionStatus.value = result;
    if (_connectionStatus.value == ConnectivityResult.none) {
      RLoaders.warningSnackBar(title: 'No Internet Connection');
    }
  }
  // Check internet Status Explicitly
  Future<bool> isConnected() async {
    try {
      final List<ConnectivityResult> result = await _connectivity.checkConnectivity();
      return result.isNotEmpty && result[0] != ConnectivityResult.none;
    } catch (e) {
      return false;
    }
}


}


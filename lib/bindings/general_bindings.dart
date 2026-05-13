import 'package:get/get.dart';
import 'package:r_store/data/services/controllers/network_manager.dart';
import 'package:r_store/features/authentication/controllers/login/login_controller.dart';
import 'package:r_store/features/shop/controllers/address_controller.dart';

class GeneralBindings extends Bindings {
  GeneralBindings(); // Added constructor

  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(LoginController());
    Get.put(AddressController());
  }
}
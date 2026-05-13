
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:r_store/data/repositories/authentication/authentication_repository.dart';
import 'package:r_store/data/services/controllers/network_manager.dart';
import 'package:r_store/features/authentication/screens/login/login.dart';
import 'package:r_store/features/personalizations/controllers/user_controller.dart';
import 'package:r_store/utils/constants/image_strings.dart';
import 'package:r_store/utils/device/device_utility.dart';
import 'package:r_store/utils/popups/full_screen_loader.dart';
import 'package:r_store/utils/popups/loaders.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final RxBool hidePassword = true.obs;
  final RxBool rememberMe = false.obs;

  final localStorage = GetStorage();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    // Load saved credentials if "Remember Me" was checked
    String? savedEmail = localStorage.read('REMEMBER_ME_EMAIL');
    String? savedPassword = localStorage.read('REMEMBER_ME_PASSWORD');
    if (savedEmail != null && savedPassword != null) {
      email.text = savedEmail;
      password.text = savedPassword;
      rememberMe.value = true;
    }
  }

  void login() async {
    if (loginFormKey.currentState!.validate()) {
      try {
        // Start Loading
        RFullScreenLoader.openLoadingDialog(
          'We are logging you in.....',
          RImages.loaderDocerAnimation,
        );

        // Check Internet connectivity
        final isConnected = await NetworkManager.instance.isConnected();
        if (!isConnected) {
          RFullScreenLoader.stopLoading();
          return;
        }

        String mail = email.text.trim();
        String pass = password.text.trim();

        // Register user in the Firebase Authentication & Save user data in the Firebase

        final userCreds = await AuthenticationRepository.instance
            .loginWithEmailAndPassword(mail, pass);

        // Show success Message
        RFullScreenLoader.stopLoading();

        RLoaders.successSnackBar(title: 'Account Logged in Successfully');

        if (rememberMe.value) {
          await localStorage.write('REMEMBER_ME_EMAIL', mail);
          await localStorage.write('REMEMBER_ME_PASSWORD', pass);
        }
        loginFormKey.currentState?.reset();

        AuthenticationRepository.instance.screenRedirect();
        // Move to Verify Email Screen
      } catch (e) {
        RFullScreenLoader.stopLoading();
        RLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      } finally {
        // await Future.delayed(const Duration(seconds: 6));
        // RFullScreenLoader.stopLoading();
        RDeviceUtils.hideKeyboard(Get.context!);
      }
    }
  }

  void logout() async {
    try {
      
      await AuthenticationRepository.instance.logout();
      RLoaders.successSnackBar(
        title: 'Logged Out',
        message: 'You have been logged out successfully.',
      );
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      RLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  void loginWithgoogle() async {
    final userController = Get.put(UserController());
    try {
      
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // RFullScreenLoader.stopLoading();
        return;
      }

      final userCreds = await AuthenticationRepository.instance.signInWithGoogle();
      if (userCreds == null) {
        // RFullScreenLoader.stopLoading();
        // print('Google Sign-In was cancelled or failed.');
         RLoaders.errorSnackBar(title: 'Error', message: 'Google Sign-In was cancelled or failed.');
        return;
      }
      
      RFullScreenLoader.openLoadingDialog('We are Logging in with Google...', RImages.loaderDocerAnimation);
      // await Future.delayed(Duration(seconds: 5));
      userController.saveUserRecord(userCreds);
      // RFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
      // Save User Data in Firestore
    } catch (e) {
      RLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
    finally {
      RFullScreenLoader.stopLoading();
    }
  }
}

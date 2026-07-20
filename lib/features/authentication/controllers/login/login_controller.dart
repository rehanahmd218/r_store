
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
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
    bool dialogOpened = false;
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      final userCreds = await AuthenticationRepository.instance.signInWithGoogle();
      if (userCreds == null) {
        // User cancelled — do nothing, no snackbar needed
        return;
      }

      // Only open the dialog after we have confirmed credentials
      dialogOpened = true;
      RFullScreenLoader.openLoadingDialog('We are Logging in with Google...', RImages.loaderDocerAnimation);
      userController.saveUserRecord(userCreds);
      AuthenticationRepository.instance.screenRedirect();
    } on PlatformException catch (e) {
      // Silently ignore user cancellation
      final code = e.code.toLowerCase();
      if (code.contains('canceled') || code.contains('cancelled') || code.contains('sign_in_canceled')) {
        return;
      }
      RLoaders.errorSnackBar(title: 'Error', message: e.message ?? e.toString());
    } catch (e) {
      final msg = e.toString().toLowerCase();
      // Silently ignore cancellation from google_sign_in
      if (msg.contains('canceled') || msg.contains('cancelled') || msg.contains('sign_in_canceled')) {
        return;
      }
      RLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      // Only pop the dialog if it was actually opened
      if (dialogOpened) {
        RFullScreenLoader.stopLoading();
      }
    }
  }
}

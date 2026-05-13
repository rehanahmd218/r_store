// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:r_store/data/repositories/authentication/authentication_repository.dart';
import 'package:r_store/data/repositories/user/user_repository.dart';
import 'package:r_store/data/services/controllers/network_manager.dart';
import 'package:r_store/features/authentication/models/user_model.dart';
import 'package:r_store/features/authentication/screens/signup/verify_email_screen.dart';
import 'package:r_store/utils/constants/image_strings.dart';
import 'package:r_store/utils/device/device_utility.dart';
import 'package:r_store/utils/popups/full_screen_loader.dart';
import 'package:r_store/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.isRegistered<SignupController>()
      ? Get.find<SignupController>()
      : Get.put(SignupController());

  final RxBool privacyPolicyAccepted = false.obs;
  final RxBool hidePassword = true.obs;
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phoneNo = TextEditingController();
  final TextEditingController username = TextEditingController();

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  void signUp() async {
    if (signUpFormKey.currentState!.validate()) {
      try {
        // Start Loading
        RFullScreenLoader.openLoadingDialog(
          'We are processing your information.....',
          RImages.loaderDocerAnimation,
        );

        // Check Internet connectivity
        final isConnected = await NetworkManager.instance.isConnected();
        if (!isConnected) {
          RFullScreenLoader.stopLoading();
          return;
        }

        // Check Privacy Policy
        if (!privacyPolicyAccepted.value) {
          RFullScreenLoader.stopLoading();

          RLoaders.warningSnackBar(
            title: 'Please accept Privacy Policy',
            message:
                'You must accept our Privacy Policy and Terms of Use to proceed.',
            duration: 5,
          );
          return;
        }

        String fName = firstName.text.trim();
        String lName = lastName.text.trim();
        String mail = email.text.trim();
        String pass = password.text.trim();
        String phone = phoneNo.text.trim();
        String user = username.text.trim();

        // Register user in the Firebase Authentication & Save user data in the Firebase

        final userCreds = await AuthenticationRepository.instance
            .registerWithEmailAndPassword(mail, pass);

        final userRepositoryController = Get.put(UserRepository());
        // Save Autnticated user data in the Firebase Firestore
        userRepositoryController.saveUserData(
          UserModel(
            id: userCreds.user!.uid,
            email: mail,
            firstName: fName,
            lastName: lName,
            phoneNo: phone,
            username: user,
            profilePicture: '',
          ),
        );
        // Show success Message
      RFullScreenLoader.stopLoading();

      RLoaders.successSnackBar(title: 'Account Created Successfully', message: 'Please verify your email to continue.');

      Get.offAll(() => VerifyEmailScreen(email: mail));

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


}

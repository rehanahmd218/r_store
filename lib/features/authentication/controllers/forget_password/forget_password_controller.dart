import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:r_store/data/repositories/authentication/authentication_repository.dart';
import 'package:r_store/data/services/controllers/network_manager.dart';
import 'package:r_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:r_store/utils/constants/image_strings.dart';
import 'package:r_store/utils/popups/full_screen_loader.dart';
import 'package:r_store/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.isRegistered<ForgetPasswordController>()
      ? Get.find<ForgetPasswordController>()
      : Get.put(ForgetPasswordController());

  final TextEditingController email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  void sendResetPasswordEmail(String? tempMail) async {
    if (forgetPasswordFormKey.currentState!.validate()) {
      String mail = tempMail ?? email.text.trim();
      RFullScreenLoader.openLoadingDialog(
        'Sending password reset email.....',
        RImages.loaderDocerAnimation,
      );
      if (!await NetworkManager.instance.isConnected()) {
        RFullScreenLoader.stopLoading();
        return;
      }

      try {
        await AuthenticationRepository.instance.sendPasswordResetEmail(mail);
        RFullScreenLoader.stopLoading();

        Get.to(
          () => ResetPasswordScreen(
            email: ForgetPasswordController.instance.email.text.trim(),
          ),
        );
      } catch (e) {
        RFullScreenLoader.stopLoading();
        RLoaders.errorSnackBar(title: 'Error', message: e.toString());
      }
    }
  }

  void resendPasswordResetEmail(String email) {
    sendResetPasswordEmail(email);
  }
}

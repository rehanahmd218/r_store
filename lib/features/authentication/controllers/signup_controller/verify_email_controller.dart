import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:r_store/common/screens/success_screen.dart';
import 'package:r_store/data/repositories/authentication/authentication_repository.dart';
import 'package:r_store/utils/constants/image_strings.dart';
import 'package:r_store/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    sendEmailVerification();
    setAutoRedirectTimer();
  }


void setAutoRedirectTimer() async {
  Timer.periodic(const Duration(seconds: 2), (timer) async {
    if (await checkEmailVerified(showErrors: false) == true) {
      timer.cancel();
      print('\n\nEmail verified! Timer cancelled.\n\n');
      return;
    }
    print('\n\nChecking email verification... Timer still running \n\n');
  });
}

Future<bool> checkEmailVerified({bool showErrors = true}) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  try {
    await auth.currentUser?.reload();
    if (auth.currentUser?.emailVerified ?? false) {
      Get.offAll(
        () => SuccessScreen(
          title: 'Email Verified',
          subtitle: 'Your email has been successfully verified.',
          image: RImages.staticSuccessIllustration,
          onPressed: () {
            AuthenticationRepository.instance.screenRedirect();
          },
        ),
      );
      return true;
    }
  } catch (e) {
    if (showErrors) {
      RLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
    return false;
  }
  return false;
}

void sendEmailVerification() {
  try {
    AuthenticationRepository.instance.sendEmailVerification();
    RLoaders.successSnackBar(
      title: 'Email Sent',
      message: 'Please check your email to verify your account',
    );
  } catch (e) {
    RLoaders.errorSnackBar(title: 'Error', message: e.toString());
  }
}
}
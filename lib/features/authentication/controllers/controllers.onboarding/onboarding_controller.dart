import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:r_store/data/repositories/authentication/authentication_repository.dart';
import 'package:r_store/features/authentication/screens/login/login.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.isRegistered<OnboardingController>()
      ? Get.find<OnboardingController>()
      : Get.put(OnboardingController());

  /// Variables
  ///
  // Update Current Index when Page Scroll
  final PageController pageController = PageController();
  final RxInt currentIndex = 0.obs;

  // Update Current Index when Page Scroll
  void updatePageIndicator(index) {
    currentIndex.value = index;
  }

  // Jump to the specific dot sleected page
  void dotNavigationClick(index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  // Update Current Index and Jump to next page
  void nextPage() {
    if (currentIndex.value == 2) {
      AuthenticationRepository.instance.deviceStorage.write('isFirstTime', false);
      
      Get.offAll(() => LoginScreen());
    } else {
      pageController.jumpToPage(currentIndex.value + 1);
    }
  }

  // Update Current Index and Jump to the last Page
  void skipPage() {
    currentIndex.value = 2;
    pageController.jumpToPage(currentIndex.value);
  }
}

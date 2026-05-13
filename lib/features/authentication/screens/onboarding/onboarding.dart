import 'package:flutter/material.dart';
import 'package:r_store/features/authentication/controllers/controllers.onboarding/onboarding_controller.dart';
import 'package:r_store/features/authentication/screens/onboarding/onboarding.widgets/onboarding_dot_navigation.dart';
import 'package:r_store/features/authentication/screens/onboarding/onboarding.widgets/onboarding_next_button.dart';
import 'package:r_store/features/authentication/screens/onboarding/onboarding.widgets/onboarding_page.dart';
import 'package:r_store/features/authentication/screens/onboarding/onboarding.widgets/onboarding_skip.dart';
import 'package:r_store/utils/constants/image_strings.dart';
import 'package:r_store/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              // Horizental Scrollable Pages
              OnBoardingPage(
                image: RImages.onBoardingImage1,
                title: RTexts.onBoardingTitle1,
                subtitle: RTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: RImages.onBoardingImage2,
                title: RTexts.onBoardingTitle2,
                subtitle: RTexts.onBoardingSubTitle2,
              ),

              OnBoardingPage(
                image: RImages.onBoardingImage3,
                title: RTexts.onBoardingTitle3,
                subtitle: RTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          // Skip Button
          OnBoardingSkipButton(),

          // Dot Navigation SmoothPageIndicator
          OnBoardingDotNavigation(),

          // Circular Button
          OnBoardingNextButton(),
        ],
      ),
    );
  }
}

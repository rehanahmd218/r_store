import 'package:flutter/material.dart';
import 'package:r_store/features/authentication/controllers/controllers.onboarding/onboarding_controller.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/device/device_utility.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/helpers/helper_functions.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    final isDark = RHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: RDeviceUtils.getBottomNavigationBarHeight() + RSizes.defaultSpace,
      left: RSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
          dotHeight: 6,
          activeDotColor: isDark ? RColors.white : RColors.black,
        ),
      ),
    );
  }
}

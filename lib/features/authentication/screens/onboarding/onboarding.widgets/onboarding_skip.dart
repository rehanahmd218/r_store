import 'package:flutter/material.dart';
import 'package:r_store/features/authentication/controllers/controllers.onboarding/onboarding_controller.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/device/device_utility.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: RDeviceUtils.getAppBarHeight(),

      right: RSizes.defaultSpace,
      child: TextButton(
        onPressed: OnboardingController.instance.skipPage,
        child: Text('Skip', style: Theme.of(context).textTheme.labelSmall),
      ),
    );
  }
}

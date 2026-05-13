import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/features/authentication/controllers/controllers.onboarding/onboarding_controller.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/device/device_utility.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    return Positioned(
      bottom: RDeviceUtils.getBottomNavigationBarHeight(),
      right: RSizes.defaultSpace,
      child: ElevatedButton(
        onPressed: controller.nextPage,
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
          shape: WidgetStateProperty.all(const CircleBorder()),
        ),
        child: Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}

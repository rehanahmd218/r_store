import 'package:flutter/material.dart';
import 'package:r_store/features/authentication/controllers/login/login_controller.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/image_strings.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/helpers/helper_functions.dart';

class RSocialButtons extends StatelessWidget {
  const RSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        socialIcon(isDark, RImages.google, LoginController.instance.loginWithgoogle),
        const SizedBox(width: RSizes.spaceBtwItems),
        socialIcon(isDark, RImages.facebook, (){}),
      ],
    );
  }

  Container socialIcon(bool isDark, String imagePath , VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isDark ? RColors.black : RColors.white,
        border: Border.all(
          color: isDark ? RColors.lightGrey : RColors.darkGrey,
          width: 1,
        ),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Image(
          image: AssetImage(imagePath),
          width: RSizes.iconMd,
          height: RSizes.iconMd,
        ),
      ),
    );
  }
}

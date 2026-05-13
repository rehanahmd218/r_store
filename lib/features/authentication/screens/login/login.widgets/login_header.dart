import 'package:flutter/material.dart';
import 'package:r_store/utils/constants/image_strings.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/constants/text_strings.dart';
import 'package:r_store/utils/helpers/helper_functions.dart';

class RLoginHeader extends StatelessWidget {
  const RLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(
            isDark ? RImages.lightAppLogo : RImages.darkAppLogo,
          ),
          height: 150,
        ),
        Text(
          RTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: RSizes.sm),
        Text(
          RTexts.loginSubtitle,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:r_store/features/authentication/controllers/signup_controller/signup_controller.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/constants/text_strings.dart';
import 'package:r_store/utils/helpers/helper_functions.dart';

class TermsConditionsCheckBox extends StatelessWidget {
  const TermsConditionsCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    final controller = SignupController.instance;
    return Row(
      children: [
        SizedBox(
          width: RSizes.lg,
          height: RSizes.lg,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicyAccepted.value,
              onChanged: (value) {
                controller.privacyPolicyAccepted.value = value!;
              },
            ),
          ),
        ),
        const SizedBox(width: RSizes.spaceBtwItems),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${RTexts.iAgreeTo} ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: RTexts.privacyPolicy,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: isDark ? RColors.white : RColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: isDark ? RColors.white : RColors.primary,
                  ),
                ),
                TextSpan(
                  text: ' and ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: RTexts.termsOfUse,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: isDark ? RColors.white : RColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: isDark ? RColors.white : RColors.primary,
                  ),
                ),
              ],
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

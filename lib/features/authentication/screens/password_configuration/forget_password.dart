import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/common/styles/spacing_styles.dart';
import 'package:r_store/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/constants/text_strings.dart';
import 'package:r_store/utils/validators/validations.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: RSpacingStyles.paddingWithAppBar,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                RTexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: RSizes.spaceBtwItems),
              Text(
                RTexts.forgetPasswordSubtitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: RSizes.spaceBtwSections),
              Form(
                key: controller.forgetPasswordFormKey,
                child: TextFormField(
                  controller: controller.email,
                  validator: (value) => RValidator.validateEmail(value),
                  decoration: InputDecoration(
                    labelText: RTexts.email,
                    prefixIcon: const Icon(Iconsax.direct_right),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: RSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.sendResetPasswordEmail(null);
                  },
                  child: Text(RTexts.submitButton),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

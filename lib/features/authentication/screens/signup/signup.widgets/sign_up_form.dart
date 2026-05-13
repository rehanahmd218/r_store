import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/features/authentication/controllers/signup_controller/signup_controller.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/constants/text_strings.dart';
import 'package:r_store/utils/validators/validations.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.put(SignupController());
    
    return Form(
      key: controller.signUpFormKey,

      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      RValidator.validateRequiredField('First Name', value),
                  expands: false,
                  decoration: InputDecoration(
                    labelText: RTexts.firstName,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Iconsax.user),
                    // labelStyle: TextStyle(
                    //   fontSize: RSizes.fontXs,
                    //   color: Theme.of(
                    //     context,
                    //   ).inputDecorationTheme.labelStyle?.color,
                    // ),
                  ),
                ),
              ),
              const SizedBox(width: RSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  validator: (value) =>
                      RValidator.validateRequiredField('Last Name', value),
                  controller: controller.lastName,
                  expands: false,
                  decoration: InputDecoration(
                    labelText: RTexts.lastName,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: RSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                RValidator.validateRequiredField('Username', value),
            expands: false,
            decoration: InputDecoration(
              labelText: RTexts.username,
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Iconsax.user_add),
            ),
          ),
          const SizedBox(height: RSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.email,
            validator: (value) => RValidator.validateEmail(value),
            expands: false,
            decoration: InputDecoration(
              labelText: RTexts.email,
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Iconsax.message),
            ),
          ),

          const SizedBox(height: RSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.phoneNo,
            validator: (value) => RValidator.validePhoneNumber(value),
            expands: false,
            decoration: InputDecoration(
              labelText: RTexts.phoneNo,
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: RSizes.spaceBtwInputFields),
          Obx(
            () => TextFormField(
              controller: controller.password,
              expands: false,
              validator: (value) => RValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: RTexts.password,
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Iconsax.lock),
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.hidePassword.value =
                        !controller.hidePassword.value;
                  },
                  icon: controller.hidePassword.value
                      ? const Icon(Iconsax.eye_slash)
                      : const Icon(Iconsax.eye),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

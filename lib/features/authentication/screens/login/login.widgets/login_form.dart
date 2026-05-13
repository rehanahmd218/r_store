import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/features/authentication/controllers/login/login_controller.dart';
import 'package:r_store/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:r_store/features/authentication/screens/signup/signup_screen.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/constants/text_strings.dart';
import 'package:r_store/utils/validators/validations.dart';

class RLoginForm extends StatelessWidget {
  const RLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
    return Form(
      key: controller.loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Email TextField
          TextFormField(
            controller: controller.email,
            validator: (value) => RValidator.validateEmail(value),
            decoration: InputDecoration(
              labelText: RTexts.email,
              prefixIcon: Icon(Iconsax.direct_right),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: RSizes.spaceBtwInputFields),

          // Password TextField
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

          const SizedBox(height: RSizes.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Obx(() => Checkbox(value: controller.rememberMe.value, onChanged: (value) {
                    controller.rememberMe.value = value ?? false;
                  })),
                  Text(RTexts.rememberMe),
                ],
              ),

              TextButton(
                onPressed: () {
                  // Handle forgot password action
                  Get.to(() => const ForgetPasswordScreen());
                },
                child: Text(
                  RTexts.forgetPassword,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ],
          ),

          const SizedBox(height: RSizes.spaceBtwSections),

          // Login Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Handle login action
                // controller
                controller.login();
              },
              child: const Text(RTexts.signIn),
            ),
          ),
          const SizedBox(height: RSizes.spaceBtwItems),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                Get.to(SignupScreen());
              },
              child: const Text(RTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}

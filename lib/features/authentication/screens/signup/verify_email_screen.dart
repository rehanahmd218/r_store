import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_store/features/authentication/controllers/login/login_controller.dart';
import 'package:r_store/features/authentication/controllers/signup_controller/verify_email_controller.dart';
import 'package:r_store/utils/constants/image_strings.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/constants/text_strings.dart';
import 'package:r_store/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    final loginController = LoginController.instance;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              loginController.logout();
            },
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(RImages.deliveredEmailIllustration),
                width: RHelperFunctions.screenWidth() * 0.6,
              ),
              // Add your email verification UI components here
              const SizedBox(height: RSizes.spaceBtwSections),
              Text(
                RTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: RSizes.spaceBtwItems),
              Text(
                email,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: RSizes.spaceBtwItems),
              Text(
                RTexts.confirmEmailSubtitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: RSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await controller.checkEmailVerified();
                  },
                  child: Text(RTexts.continueButton),
                ),
              ),
              const SizedBox(height: RSizes.spaceBtwItems),
              TextButton(
                onPressed: () {
                  controller.sendEmailVerification();
                },
                child: Text(
                  RTexts.resendEmail,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              // You can add more widgets like TextFields, Buttons, etc.
            ],
          ),
        ),
      ),
    );
  }
}

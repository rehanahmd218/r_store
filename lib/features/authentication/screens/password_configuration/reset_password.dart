import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_store/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:r_store/features/authentication/screens/login/login.dart';
import 'package:r_store/utils/constants/image_strings.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/constants/text_strings.dart';
import 'package:r_store/utils/helpers/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key,required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.offAll(() => const LoginScreen());
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
                RTexts.resetEmailSentTitle,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: RSizes.spaceBtwItems),

              Text(
                RTexts.resetEmailSentSubtitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: RSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAll(() => LoginScreen());
                  },
                  child: Text('Done'),
                ),
              ),
              const SizedBox(height: RSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    ForgetPasswordController.instance.sendResetPasswordEmail(email);
                  },
                  child: Text('Resend Email'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

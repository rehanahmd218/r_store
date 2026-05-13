import 'package:flutter/material.dart';
import 'package:r_store/common/widgets/widget.login_signup/form_divider.dart';
import 'package:r_store/common/widgets/widget.login_signup/social_buttons.dart';
import 'package:r_store/features/authentication/controllers/signup_controller/signup_controller.dart';
import 'package:r_store/features/authentication/screens/signup/signup.widgets/sign_up_form.dart';
import 'package:r_store/features/authentication/screens/signup/signup.widgets/terms_conditions_signup.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
         
          
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                RTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: RSizes.spaceBtwSections),
              SignUpForm(),
              const SizedBox(height: RSizes.spaceBtwSections),
              TermsConditionsCheckBox(),
              const SizedBox(height: RSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    SignupController.instance.signUp();
                  },
                  child: Text(RTexts.createAccount),
                ),
              ),

              const SizedBox(height: RSizes.spaceBtwItems),
              RFormDivider(dividerText: RTexts.orSignUpWith),
              const SizedBox(height: RSizes.spaceBtwSections),
              RSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:r_store/common/styles/spacing_styles.dart';
import 'package:r_store/features/authentication/controllers/login/login_controller.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/constants/text_strings.dart';
import 'package:r_store/features/authentication/screens/login/login.widgets/login_form.dart';
import 'package:r_store/common/widgets/widget.login_signup/social_buttons.dart';
import 'package:r_store/common/widgets/widget.login_signup/form_divider.dart';
import 'package:r_store/features/authentication/screens/login/login.widgets/login_header.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: RSpacingStyles.paddingWithAppBar,
          child: Column(
            // Logo , Title And Sub-Title
            // LoginHeader,
            children: [
              RLoginHeader(),

              const SizedBox(height: RSizes.spaceBtwSections),
              RLoginForm(),
              const SizedBox(height: RSizes.spaceBtwSections / 2),
              const RFormDivider(dividerText: RTexts.orSignInWith),
              const SizedBox(height: RSizes.spaceBtwSections / 2),
              const RSocialButtons(),
            ],
            // LoginForm.

            // FormDivider,
            // SocialButtons.
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/common/prefferd_sized/appbar.dart';
import 'package:r_store/features/personalizations/controllers/user_controller.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/validators/validations.dart';

class ReauthLoginForm extends StatelessWidget {
  const ReauthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RAppBar(
        title: Text(
          'Re-authenticate',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(RSizes.defaultSpace),
        child: Form(
          key: UserController.instance.reAuthFormKey,
          child: Column(
            children: [
              TextFormField(
                controller: UserController.instance.verifyEmail,
                validator: (value) => RValidator.validateEmail(value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: RSizes.spaceBtwItems),
              Obx(
                () => TextFormField(
                  controller: UserController.instance.password,
                  validator: (value) => RValidator.validatePassword(value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.lock),
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    suffixIcon: UserController.instance.hidePassword.value
                        ? Icon(Iconsax.eye_slash)
                        : Icon(Iconsax.eye),
                  ),
                  obscureText: UserController.instance.hidePassword.value,
                ),
              ),
              const SizedBox(height: RSizes.spaceBtwItems),
              ElevatedButton(
                onPressed: () {
                  // Handle re-authentication logic here
                },
                child:  SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: RSizes.md),
                    ),
                    onPressed: () {
                      UserController.instance.deleteEmailSignedInUser();
                    },
                    child: Text(
                      'Verify',
                     
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

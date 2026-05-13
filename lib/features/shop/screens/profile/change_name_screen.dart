import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/common/prefferd_sized/appbar.dart';
import 'package:r_store/features/personalizations/controllers/user_controller.dart';
import 'package:r_store/features/shop/screens/profile/profile_screen.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/validators/validations.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RAppBar(
        // actions: [],
        showBackButton: true,
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(padding: EdgeInsets.all(RSizes.defaultSpace),child: Form(
        key: UserController.instance.nameFormKey,
        child: Column(
          spacing: 20,
          children: [
            Text('Use real names for easy verification. You can change it later.',style: Theme.of(context).textTheme.labelSmall,),
            TextFormField(
              controller: UserController.instance.firstName,
              validator: (value) => RValidator.validateRequiredField('First Name', value),
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.user),
                labelText: 'First Name',
                hintText: 'Enter your first name',
                
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              expands: false,
              controller: UserController.instance.lastName,
              validator: (value) => RValidator.validateRequiredField('Last Name', value),
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.user),
                labelText: 'Last Name',
                hintText: 'Enter your last name',
                border: OutlineInputBorder(),
                
              ),
            ),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (
            
            ) {
              UserController.instance.user.value.firstName = UserController.instance.firstName.text.trim();
              UserController.instance.user.value.lastName = UserController.instance.lastName.text.trim();

              UserController.instance.updateSingleField({
                'First Name': UserController.instance.user.value.firstName,
                'Last Name': UserController.instance.user.value.lastName,
              });

              Get.off(() => const ProfileScreen());
            }, child: Text('Save Changes'))),
          ],
        ),
      ),),
    );
  }
}

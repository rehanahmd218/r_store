import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/common/prefferd_sized/appbar.dart';
import 'package:r_store/data/repositories/authentication/authentication_repository.dart';
import 'package:r_store/features/shop/controllers/address_controller.dart';
import 'package:r_store/features/shop/models/address_mode.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/validators/validations.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar: RAppBar(
        title: Text(
          'Add New Address',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(RSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey.value,
            child: Column(
              spacing: RSizes.spaceBtwInputFields,
              children: [
                TextFormField(
                  validator: (value) =>
                      RValidator.validateRequiredField('Name', value),
                  controller: controller.name.value,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: 'Name',
                  ),
                ),
                TextFormField(
                  controller: controller.phoneNumber.value,
                  validator: (value) => RValidator.validePhoneNumber(value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile),
                    labelText: 'Phone',
                  ),
                ),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.street.value,
                        validator: (value) =>
                            RValidator.validateRequiredField('Street', value),
                        decoration: InputDecoration(
                          labelText: 'Street',
                          
                          prefixIcon: Icon(Iconsax.building_31),
                        ),
                      ),
                    ),
                    const SizedBox(width: RSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        controller: controller.postalCode.value,
                        validator: (value) => RValidator.validateRequiredField(
                          'Postal Code',
                          value,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Postal Code',
                          prefixIcon: Icon(Iconsax.code),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.city.value,
                        validator: (value) =>
                            RValidator.validateRequiredField('City', value),
                        decoration: InputDecoration(
                          labelText: 'City',
                          prefixIcon: Icon(Iconsax.building),
                        ),
                      ),
                    ),
                    const SizedBox(width: RSizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        controller: controller.state.value,
                        validator: (value) =>
                            RValidator.validateRequiredField('State', value),
                        decoration: InputDecoration(
                          labelText: 'State',
                          prefixIcon: Icon(Iconsax.activity),
                        ),
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: controller.country.value,
                  validator: (value) =>
                      RValidator.validateRequiredField('Country', value),
                  decoration: InputDecoration(
                    labelText: 'Country',
                    prefixIcon: Icon(Iconsax.global),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.addSingleAddress();
                    },
                    child: Text('Save Address'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

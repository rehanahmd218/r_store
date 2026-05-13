import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/common/prefferd_sized/appbar.dart';
import 'package:r_store/features/shop/controllers/address_controller.dart';
import 'package:r_store/features/shop/screens/addresses/new_address_screen.dart';
import 'package:r_store/features/shop/screens/addresses/widgets/address_card.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:r_store/utils/helpers/cloud_helper_functions.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return Scaffold(
      appBar: RAppBar(
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        showBackButton: true,
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          Get.to(() => const AddNewAddressScreen());
        },
        icon: Icon(Iconsax.add, color: RColors.white),
        style: IconButton.styleFrom(backgroundColor: RColors.primary),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(RSizes.defaultSpace),
          child: FutureBuilder(
            future: addressController.fetchAllAddresses(),
            builder: (context, asyncSnapshot) {
              final widget = RCloudHelperFunctions.checkMultiRecordState(
                snapshot: asyncSnapshot,
              );
              if (widget != null) {
                return widget;
              }

              if (addressController.addressList.isEmpty) {
                return Center(
                  child: Text(
                    "No addresses found. Please add a new address.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                );
              }

              return Obx(
                () => ListView.separated(
                  separatorBuilder: (context, index) =>
                      SizedBox(height: RSizes.sm),
                  shrinkWrap: true,
                  itemCount: addressController.addressList.length,
                  itemBuilder: (context, index) {
                    final address = addressController.addressList[index];
                    return RAddressCard(address: address);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

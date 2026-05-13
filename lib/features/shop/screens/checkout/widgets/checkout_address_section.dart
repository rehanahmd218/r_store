import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/common/widgets/texts/section_heading.dart';
import 'package:r_store/features/shop/controllers/address_controller.dart';
import 'package:r_store/utils/constants/sizes.dart';

class RCheckoutAddressSection extends StatelessWidget {
  const RCheckoutAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: RSizes.sm,
        children: [
          RSectionHeading(
            title: 'Shipping Address',
            showActionButton: true,
            buttonTitle: 'Change',
            onButtonPressed: () {
              AddressController.instance.changeAddressPopup(context);
            },
          ),
          if (AddressController.instance.selectedAddress.value.id.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  addressController.selectedAddress.value.name,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Row(
                  children: [
                    Icon(Iconsax.mobile),
                    SizedBox(width: RSizes.sm),
                    Text(
                      addressController.selectedAddress.value.formattedPhoneNo,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Iconsax.location),
                    SizedBox(width: RSizes.sm),
                    Flexible(
                      child: Text(
                        maxLines: 3,
                        addressController.selectedAddress.value.toString(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}

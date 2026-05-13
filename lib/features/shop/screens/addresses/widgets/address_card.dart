import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/common/widgets/custome_shapes/containers/rounded_container.dart';
import 'package:r_store/features/shop/controllers/address_controller.dart';
import 'package:r_store/features/shop/models/address_mode.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/helpers/helper_functions.dart';

class RAddressCard extends StatelessWidget {
  const RAddressCard({super.key, required this.address});
  final AddressModel address;

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    final isSelected =
        address == AddressController.instance.selectedAddress.value;
    return InkWell(
      onTap: () {
        AddressController.instance.selectAddress(address);
        // Get.back();
      },
      child: RRoundedContainer(
        padding: EdgeInsets.all(RSizes.md),
        bgColor: isSelected
            ? RColors.primary.withValues(alpha: 0.7)
            : Colors.transparent,
        showBorder: true,

        child: Column(
          spacing: RSizes.xs,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  address.name,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                isSelected
                    ? Icon(Iconsax.tick_circle5, color: RColors.primary)
                    : SizedBox.shrink(),
              ],
            ),
            Text(
              address.formattedPhoneNo,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              address.toString(),
              style: Theme.of(context).textTheme.bodySmall,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}

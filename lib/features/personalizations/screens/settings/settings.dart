import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/common/prefferd_sized/appbar.dart';
import 'package:r_store/common/widgets/custome_shapes/containers/primary_header_container.dart';
import 'package:r_store/common/widgets/list_tiles/setting_menu_title.dart';
import 'package:r_store/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:r_store/common/widgets/texts/section_heading.dart';
import 'package:r_store/features/authentication/controllers/login/login_controller.dart';
import 'package:r_store/features/shop/screens/addresses/user_address_screen.dart';
import 'package:r_store/features/shop/screens/cart/cart_screen.dart';
import 'package:r_store/features/shop/screens/dummyData/upload_data_screen.dart';
import 'package:r_store/features/shop/screens/orders/orders_screen.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            RPrimaryHeaderContainer(
              child: Column(
                children: [
                  // App Bar
                  RAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall!.apply(color: RColors.white),
                    ),
                  ),

                  // User Profile Card
                  RUserProfileTile(),
                  const SizedBox(height: RSizes.spaceBtwSections),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(RSizes.defaultSpace),
              child: Column(
                children: [
                  RSectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(height: RSizes.spaceBtwItems),
                  RSettingMenuTile(
                    leadingIcon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subtitle: 'Set shopping address',
                    onTap: () {
                      Get.to(() => const UserAddressScreen());
                    },
                  ),
                  RSettingMenuTile(
                    leadingIcon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subtitle: 'Add, remove products and move to checkout',
                    onTap: () {
                      Get.to(() => const CartScreen());
                    },
                  ),
                  RSettingMenuTile(
                    leadingIcon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subtitle: 'In-progress and completed Orders',
                    onTap: () {
                      Get.to(() => const OrdersScreen());
                    },
                  ),
                  RSettingMenuTile(
                    leadingIcon: Iconsax.bank,
                    title: 'Bank Account',
                    subtitle: 'Withdraw balance to registered bank account',
                    onTap: () {},
                  ),
                  RSettingMenuTile(
                    leadingIcon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subtitle: 'List of All discounted Coupons',
                    onTap: () {},
                  ),
                  RSettingMenuTile(
                    leadingIcon: Iconsax.notification,
                    title: 'Notifications',
                    subtitle: 'Set any kind of notification message',
                    onTap: () {},
                  ),
                  RSettingMenuTile(
                    leadingIcon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subtitle: 'Manage data usage and connected accounts',
                    onTap: () {},
                  ),

                  const SizedBox(height: RSizes.spaceBtwSections),
                  RSectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  SizedBox(height: RSizes.spaceBtwItems),
                  RSettingMenuTile(
                    leadingIcon: Iconsax.document_upload,
                    subtitle: 'Upload Data to your Cloud Firebase',
                    title: 'Load Data',
                  ),
                  RSettingMenuTile(
                    leadingIcon: Iconsax.location,
                    subtitle: 'Set recommendation based on location',
                    title: 'Geolocation',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  RSettingMenuTile(
                    leadingIcon: Iconsax.security_user,
                    subtitle: 'Search result is safe for all ages',
                    title: 'Safe Mode',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  RSettingMenuTile(
                    leadingIcon: Iconsax.image,
                    subtitle: 'Set image quality to be seen',
                    title: 'HD Image Quality',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  RSettingMenuTile(
                    leadingIcon: Iconsax.document_upload,
                    subtitle: 'Upload Data to your Cloud Firebase',
                    title: 'Upload Data',
                    onTap: () {
                      final TextEditingController passwordController = TextEditingController();
                      Get.defaultDialog(
                        title: 'Admin Access',
                        content: Column(
                          children: [
                            const Text('Please enter the password to access the upload screen.'),
                            const SizedBox(height: 10),
                            TextField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(hintText: 'Password'),
                            ),
                          ],
                        ),
                        confirm: ElevatedButton(
                          onPressed: () {
                            if (passwordController.text == 'RehanStore@7869@123') {
                              Get.back(); // close dialog
                              Get.to(() => const UploadDataScreen());
                            } else {
                              Get.snackbar('Error', 'Incorrect password', snackPosition: SnackPosition.BOTTOM);
                            }
                          },
                          child: const Text('Submit'),
                        ),
                        cancel: OutlinedButton(
                          onPressed: () => Get.back(),
                          child: const Text('Cancel'),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: RSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        LoginController.instance.logout();
                      },
                      child: Text(
                        'Log Out',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium!,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

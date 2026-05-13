import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_store/common/prefferd_sized/appbar.dart';
import 'package:r_store/common/widgets/images/circular_image.dart';
import 'package:r_store/common/widgets/texts/section_heading.dart';
import 'package:r_store/features/personalizations/controllers/user_controller.dart';
import 'package:r_store/features/shop/screens/profile/change_name_screen.dart';
import 'package:r_store/features/shop/screens/profile/widgets/profile_data_tile.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/image_strings.dart';
import 'package:r_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> personalInformationData = {
      'User ID': '12345',
      "E-mail": 'rehanahmd218@gmail.com',
      "Phone Number": "+923093288819",
      "Gender": "Male",
      "Date of Birth": "12 Oct, 2003",
    };
    return Scaffold(
      appBar: RAppBar(
        title: Text('Profile', style: Theme.of(context).textTheme.titleLarge),
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = UserController.instance.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : RImages.darkAppLogo;
                          
                      return RCircularImage(
                        imgUrl: image,
                        width: 70,
                        height: 70,
                        isNetworkImg: networkImage.isNotEmpty,
                      );
                    }),
                    TextButton(
                      onPressed: UserController.instance.uploadUserProfilePicture,
                      child: Text(
                        'Change Profile Picture',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              const SizedBox(height: RSizes.spaceBtwItems),
              RSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(height: RSizes.spaceBtwItems),
              Obx(
                () => RProfileData(
                  name: 'Name',
                  value: UserController.instance.user.value.fullName,
                  onTap: () => Get.to(() => ChangeNameScreen()),
                ),
              ),

              Obx(
                () => RProfileData(
                  name: 'Username',
                  value: UserController.instance.user.value.username,
                ),
              ),
              Divider(),
              const SizedBox(height: RSizes.spaceBtwItems),
              RSectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(height: RSizes.spaceBtwItems),
              Obx(
                () => RProfileData(
                  name: 'User ID',
                  value: UserController.instance.user.value.id,
                ),
              ),
              Obx(
                () => RProfileData(
                  name: 'Email',
                  value: UserController.instance.user.value.email,
                ),
              ),
              Obx(
                () => RProfileData(
                  name: 'Phone',
                  value: UserController.instance.user.value.phoneNo == ''
                      ? 'Not Set'
                      : UserController.instance.user.value.phoneNo,
                ),
              ),
              RProfileData(name: 'Gender', value: 'Male'),
              RProfileData(name: 'Date of Birth', value: '12 Oct, 2003'),
              Divider(),
              const SizedBox(height: RSizes.spaceBtwItems),
              TextButton(
                onPressed: () {
                  UserController.instance.confirmDeleteAccount();
                },
                child: Text(
                  'Close Account',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall!.apply(color: RColors.error),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

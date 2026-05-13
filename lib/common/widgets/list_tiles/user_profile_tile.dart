import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/common/widgets/images/circular_image.dart';
import 'package:r_store/features/personalizations/controllers/user_controller.dart';
import 'package:r_store/features/shop/screens/profile/profile_screen.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/image_strings.dart';

class RUserProfileTile extends StatelessWidget {
  const RUserProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: RCircularImage(
        padding: EdgeInsets.all(0),
        width: 50,
        height: 50,
        imgUrl: RImages.darkAppLogo,
        // applyImgRadius: true,
        isNetworkImg: false,
      ),
      title: Obx(() => Text(UserController.instance.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: RColors.white),)),
      subtitle: Obx(() => Text(UserController.instance.user.value.email,style: Theme.of(context).textTheme.labelSmall!.apply(color: RColors.white),)),
      trailing:

      IconButton(
        icon: Icon(Iconsax.edit,color: RColors.white,),
        onPressed: () {
          // Handle edit action
          Get.to(()=>const ProfileScreen());
        },
      ),
    );
  }
}
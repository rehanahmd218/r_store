import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/device/device_utility.dart';
import 'package:r_store/utils/helpers/helper_functions.dart';

class RAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget> actions;
  final bool showBackButton;
  final IconData? leadingIcon;
  final VoidCallback? onLeadingIconPressed;
  const RAppBar({
    super.key,
     this.title,
    this.actions = const [],
    this.showBackButton = false,
    this.leadingIcon,
    this.onLeadingIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: RSizes.defaultSpace),
      child: AppBar(
        automaticallyImplyLeading: false,
        title: title,
        actions: actions,
        leading: showBackButton
            ? IconButton(
                icon:  Icon(Iconsax.arrow_left,color: isDark ? RColors.white : RColors.black,),
                onPressed: () => Get.back(),
              )
            : leadingIcon != null
            ? IconButton(
                icon: Icon(leadingIcon!),
                onPressed: onLeadingIconPressed,
              )
            : null,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(RDeviceUtils.getAppBarHeight());
}

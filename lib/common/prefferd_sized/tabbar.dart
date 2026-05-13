import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/helpers/helper_functions.dart';

class RTabBar extends StatelessWidget implements PreferredSizeWidget {
  const RTabBar({super.key, required this.tabs});
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);

    return Material(
      color: dark ? RColors.black : RColors.white,
      child: Padding(

        padding: const EdgeInsets.only(left: RSizes.defaultSpace),
        child: TabBar(
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          
          dividerColor: Colors.transparent,
          padding: EdgeInsets.all(0),
          unselectedLabelColor: RColors.darkGrey,
          labelColor: RColors.primary,
          labelStyle: Theme.of(context).textTheme.titleMedium,
          indicatorColor: RColors.primary,
          tabs: tabs,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

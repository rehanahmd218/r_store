import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_store/common/prefferd_sized/appbar.dart';
import 'package:r_store/common/widgets/products/cart/cart_counter.dart';
import 'package:r_store/features/personalizations/controllers/user_controller.dart';
import 'package:r_store/features/shop/screens/cart/cart_screen.dart';
import 'package:r_store/utils/constants/colors.dart' show RColors;
import 'package:r_store/utils/constants/text_strings.dart';

class RHomeAppBar extends StatelessWidget {
  const RHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());

    return RAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            RTexts.homeAppbarTitle,
            style: Theme.of(context).textTheme.labelMedium!.apply(
              color: RColors.grey,
              fontWeightDelta: 2,
            ),
          ),
          Obx(() {
            if (userController.isProfileLoading.value) {
              return const SizedBox(
                width: 100,
                height: 20,
                child: LinearProgressIndicator(
                  color: RColors.white,
                  backgroundColor: RColors.lightGrey,
                ),
              );
              
            }

            return
             Text(
              userController.user.value.fullName,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.apply(color: RColors.white),
            );
          }),
        ],
      ),
      actions: [
        RCartCounterIcon(iconColor: RColors.textWhite, onPressed: () {
          Get.to(()=>const CartScreen());
        }),
      ],
    );
  }
}

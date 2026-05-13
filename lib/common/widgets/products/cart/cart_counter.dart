import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/features/shop/controllers/cart_item_controller.dart';
import 'package:r_store/utils/constants/colors.dart';

class RCartCounterIcon extends StatelessWidget {
  const RCartCounterIcon({
    super.key,
    required this.iconColor,
    required this.onPressed,
  });
  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(Iconsax.shopping_bag, color: iconColor),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: RColors.black,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Obx(
                () => Text(
                  '${CartController.instance.cartItemCount.value}',
                  style: TextStyle(color: RColors.textWhite, fontSize: 10),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/helpers/helper_functions.dart';


class RCircularIcon extends StatelessWidget {
  const RCircularIcon({super.key, this.width=RSizes.xl, this.height=RSizes.xl, this.size=RSizes.lg, required this.icon, this.iconColor, this.bgColor, this.onPressed});

  final double? width, height,size;
  final IconData icon;
  final Color? iconColor;
  final Color? bgColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width:width,
        height:height,
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color:bgColor ?? (dark ? RColors.backgroundDark:RColors.white),
        ),
        child: Icon(icon,size: size,
          color: iconColor,
        ),
      ),
    );
  }
}
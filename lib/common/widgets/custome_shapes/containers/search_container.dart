import 'package:flutter/material.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/helpers/helper_functions.dart';

class RSearchContainer extends StatelessWidget {
  final String text;
  final bool showBackground;
  final IconData? icon;
  final Function()? onPressed;
  final bool showBorder;
  final EdgeInsetsGeometry? padding;

  const RSearchContainer({
    super.key,
    this.text = "Search in Store",
    this.showBackground = true,
    this.icon,
    this.onPressed,
    this.showBorder = true,
    this.padding 
  });

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding ?? EdgeInsets.all(0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(RSizes.defaultSpace / 1.5),
          decoration: BoxDecoration(
            color: showBackground
                ? isDark
                      ? RColors.darkerGrey
                      : RColors.lightGrey
                : Colors.transparent,
            borderRadius: BorderRadius.circular(RSizes.cardRadiusLg),
            border: showBorder ?  BoxBorder.all(color: RColors.grey) : null,
          ),
          child: Row( 
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (icon != null) Icon(icon),
              const SizedBox(width: RSizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall!),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/utils/constants/sizes.dart';

class RProfileData extends StatelessWidget {

  final String name;
  final String value;
  final IconData ? icon;
  final VoidCallback ? onTap;
  const RProfileData({
    super.key, required this.name, required this.value, this.icon, this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: RSizes.spaceBtwItems),
        child: Row(
               children: [
            Expanded(
              flex: 3,
              child: Text(name,style: Theme.of(context).textTheme.bodySmall,)),
            Expanded(
              flex: 5,
              child: Text(value, style: Theme.of(context).textTheme.bodyMedium,)),
            Expanded(child: Icon(icon ?? Iconsax.arrow_right_34,size: 18,)),
         ],
        ),
      ),
    );
  }
}
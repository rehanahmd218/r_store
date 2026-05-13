import 'package:flutter/material.dart';
import 'package:r_store/common/widgets/custome_shapes/containers/rounded_container.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/sizes.dart';

class RCouponCodeField extends StatelessWidget {
  const RCouponCodeField({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return RRoundedContainer(
      showBorder: true,
      padding: EdgeInsets.all(RSizes.xs),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter Coupon Code',
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
    
              contentPadding: EdgeInsets.symmetric(horizontal: RSizes.defaultSpace, vertical: RSizes.sm),
            )
            ),
    
          ),
          const SizedBox(width:RSizes.spaceBtwItems ,),
          ElevatedButton(
            
          
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(0),
              backgroundColor: isDark ? RColors.darkGrey:RColors.grey,
              side: BorderSide(color: isDark ? RColors.darkGrey:RColors.grey),
              
            ),
            onPressed: () {},
            child: Text('Apply',style: Theme.of(context).textTheme.bodySmall,),
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/common/widgets/custome_shapes/containers/rounded_container.dart';
import 'package:r_store/common/widgets/icons/circular_icon.dart';
import 'package:r_store/features/shop/models/order_model.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/sizes.dart';

class RSingleOrderSection extends StatelessWidget {
  const RSingleOrderSection({super.key,required this.isDark, required this.order});
  
  final bool isDark;
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return RRoundedContainer(
              padding: EdgeInsets.all(RSizes.md),
              bgColor: isDark ? RColors.backgroundDark : RColors.lightGrey,
              showBorder: true,
              child: Column(
                children: [
                  Row(
                    children: [
                      // Icon(Iconsax.ship)
                      RCircularIcon(
                        icon: Iconsax.ship,
                        bgColor: isDark
                            ? RColors.backgroundDark
                            : RColors.lightGrey,
                      ),
                      const SizedBox(width: RSizes.sm),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.orderStatusText,
                            style: Theme.of(context).textTheme.bodyMedium!
                                .apply(color: RColors.primary),
                          ),
                          Text(
                            order.formattedOrderDate,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Iconsax.arrow_right_34),
                      ),
                    ],
                  ),
                  const SizedBox(height: RSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      singleDetailSection(isDark, context, 'Order ID', order.id),
                      singleDetailSection(isDark, context, 'Shipping Date', order.formattedDeliveryDate),
                    ],
                  ),
                ],
              ),
            );
  }

    Row singleDetailSection(bool isDark, BuildContext context,String title, String value) {
    return Row(
      children: [
        RCircularIcon(
          icon: Iconsax.tag,
          bgColor: isDark ? RColors.backgroundDark : RColors.lightGrey,
        ),
        const SizedBox(width: RSizes.sm),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.labelLarge),
            Text(value, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ],
    );
  }
}
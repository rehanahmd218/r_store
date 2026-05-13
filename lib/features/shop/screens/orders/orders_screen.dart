import 'package:flutter/material.dart';
import 'package:r_store/common/prefferd_sized/appbar.dart';
import 'package:r_store/features/shop/controllers/order_controller.dart';
import 'package:r_store/features/shop/screens/orders/widgets/single_order_section.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/helpers/cloud_helper_functions.dart';
import 'package:r_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    final controller = Get.isRegistered<OrderController>()
        ? OrderController.instance
        : Get.put(OrderController());

    return Scaffold(
      appBar: RAppBar(
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        showBackButton: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(RSizes.defaultSpace),
        child: FutureBuilder(
          future: controller.getOrders(),
          builder: (context, asyncSnapshot) {
            final widget = RCloudHelperFunctions.checkMultiRecordState(
              snapshot: asyncSnapshot,
            );
            if (widget != null) {
              return widget;
            }
            if (controller.orderList.isEmpty) {
              return Center(
                child: Text(
                  "No orders found.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            }
            final orders =  asyncSnapshot.data!;
            return ListView.separated(
              shrinkWrap: true,
              itemBuilder: (_, index) {
                final singleOrder  = orders[index];
                return RSingleOrderSection(isDark: isDark, order: singleOrder);
              },
              separatorBuilder: (_, __) =>
                  const SizedBox(height: RSizes.spaceBtwItems),
              itemCount: orders.length,
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/helpers/helper_functions.dart';

class RLoaders {
  static hideSnackBar() => ScaffoldMessenger.of(Get.context!).clearSnackBars();

  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: RHelperFunctions.isDarkMode(Get.context!)
                ? RColors.darkerGrey.withValues(alpha: 0.9)
                : RColors.grey.withValues(alpha: 0.9),
          ),
          child: Center(
            child: Text(
              message,
              style: Theme.of(Get.context!).textTheme.labelLarge,
            ),
          ),
        ),
      ),
    );
  }

  static void _showSnackBar(
    String title,
    String message,
    Color bgColor,
    IconData icon, {
    int duration = 3,
  }) {
    Get.closeCurrentSnackbar();
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: RColors.white,
      backgroundColor: bgColor,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(20),
      icon: Icon(icon, color: RColors.white),
    );
  }

  static successSnackBar({required title, message = '', duration = 3}) =>
      _showSnackBar(
        title,
        message,
        RColors.primary,
        Iconsax.check,
        duration: duration,
      );

  static warningSnackBar({required title, message = '', duration = 3}) =>
      _showSnackBar(
        title,
        message,
        Colors.orange,
        Iconsax.warning_2,
        duration: duration,
      );

  static errorSnackBar({required title, message = ''}) =>
      _showSnackBar(title, message, Colors.red.shade600, Iconsax.warning_2,duration: 10);
}

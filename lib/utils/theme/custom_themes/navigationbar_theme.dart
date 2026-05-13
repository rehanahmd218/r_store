import 'package:flutter/material.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/sizes.dart';

class RNavigationbarTheme {
  RNavigationbarTheme._();

  static NavigationBarThemeData lightNavigationBarTheme =
      NavigationBarThemeData(
        backgroundColor: RColors.white,
        elevation: 0,
        indicatorColor: RColors.grey,
        labelTextStyle: WidgetStatePropertyAll(
          const TextStyle(color: RColors.black, fontSize: RSizes.fontXs),
        ),
      );

  static NavigationBarThemeData darkNavigationBarTheme = NavigationBarThemeData(
    backgroundColor: RColors.black,
    indicatorColor: RColors.textSecondary,
    labelTextStyle: WidgetStatePropertyAll(
      const TextStyle(color: RColors.white, fontSize: RSizes.fontXs),
    ),
  );
}

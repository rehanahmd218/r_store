import 'package:flutter/material.dart';
import 'package:r_store/utils/constants/sizes.dart';

class RSpacingStyles {
  RSpacingStyles._();

  static const EdgeInsetsGeometry paddingWithAppBar = EdgeInsets.only(
    top: RSizes.appBarHeight,
    bottom: RSizes.defaultSpace,
    left: RSizes.defaultSpace,
    right: RSizes.defaultSpace,
  );
}

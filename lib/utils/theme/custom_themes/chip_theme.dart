import 'package:flutter/material.dart';
import 'package:r_store/utils/constants/colors.dart';

class RChipTheme {
  RChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData().copyWith(
    disabledColor: Colors.grey.shade300,
    labelStyle: const TextStyle(color: Colors.black87),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: Colors.white,
    selectedColor: RColors.primary,
  );

  static ChipThemeData darkChipTheme = ChipThemeData().copyWith(
    disabledColor: Colors.grey.shade300,
    labelStyle: const TextStyle(color: Colors.white),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: Colors.white,
    selectedColor: RColors.primary,
  );
}

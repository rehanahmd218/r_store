import 'package:flutter/material.dart';
import 'package:r_store/utils/theme/custom_themes/app_bar_theme.dart';
import 'package:r_store/utils/theme/custom_themes/navigationbar_theme.dart';
import 'package:r_store/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:r_store/utils/theme/custom_themes/check_box_theme.dart';
import 'package:r_store/utils/theme/custom_themes/chip_theme.dart';
import 'package:r_store/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:r_store/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:r_store/utils/theme/custom_themes/text_field_theme.dart';
import 'package:r_store/utils/theme/custom_themes/text_theme.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: AppTextTheme.lightTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: RAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: RBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: RCheckBoxTheme.lightCheckBoxTheme,
    chipTheme: RChipTheme.lightChipTheme,
    inputDecorationTheme: RTextFormFieldTheme.lightTextFieldTheme,
    fontFamily: 'Poppins',
    outlinedButtonTheme: AppOutlinedButtonTheme.lightOutlinedButtonTheme,
    navigationBarTheme: RNavigationbarTheme.lightNavigationBarTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: AppTextTheme.darkTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: RAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: RBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: RCheckBoxTheme.darkCheckBoxTheme,
    chipTheme: RChipTheme.darkChipTheme,
    inputDecorationTheme: RTextFormFieldTheme.darkTextFieldTheme,
    fontFamily: 'Poppins',
    outlinedButtonTheme: AppOutlinedButtonTheme.darkOutlinedButtonTheme,
    navigationBarTheme: RNavigationbarTheme.darkNavigationBarTheme,
  );
}

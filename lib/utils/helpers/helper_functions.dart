import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:get/get.dart';

class RHelperFunctions {
  static Color? getColor(String value) {
    value = value.toLowerCase();
    // Define your Product Specific Colors here and it will match the attribute colors and show specific
    switch (value) {
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;

      case 'yellow':
        return Colors.yellow;

      case 'purple':
        return Colors.purple;
      case 'orange':
        return Colors.orange;

      case 'pink':
        return Colors.pink;

      case 'black':
        return Colors.black;

      case 'white':
        return Colors.white;

      case 'grey':
        return Colors.grey;

      case 'brown':
        return Colors.brown;
      case 'cyan':
        return Colors.cyan;
      case 'teal':
        return Colors.teal;

      default:
        return null;
    }
  }

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.black87,
      ),
    );
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.sizeOf(Get.context!);
  }

  static double screenWidth() {
    return MediaQuery.sizeOf(Get.context!).width;
  }

  static double screenHeight() {
    return MediaQuery.sizeOf(Get.context!).height;
  }

  static String getFormattedDate(
    DateTime date, {
    String format = 'dd/MM/yyyy',
  }) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize){
    final wrappedList = <Widget>[];
    for (int i = 0; i < widgets.length; i += rowSize) {
      final end = (i + rowSize < widgets.length) ? i + rowSize : widgets.length;
      wrappedList.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: widgets.sublist(i, end),
      ));
    }
    return wrappedList;
  }
}

// A utility class for managing a full-screen loading dialog

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_store/common/widgets/loaders/animation_loader.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/helpers/helper_functions.dart';

class RFullScreenLoader {
  // open a full-screen loading dialog with a given text and animation
  /// This method return anything
  ///
  /// // parameters
  /// - text : the text to be displayed in the loading dialog
  /// animation: The lottie animation to be shown

  static void openLoadingDialog(String text, String animation) {
    // print('Overlay Context: ${Get.overlayContext}');
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,  // The dialog can't be dismissed by tapping outside it
      builder: (_) => PopScope(
        canPop: false,   // Disables popping with the back button
        child: Container(
        color: RHelperFunctions.isDarkMode(Get.context!) ? RColors.backgroundDark : RColors.white,
        width: double.infinity,
        
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 250,),
            RAnimationLoaderWidget(text:text,animation:animation),
          ],
        ),
      )),
    );
  }


  //// Stop the currently open loading dialog
  /// this method does'nt return Anything
  /// 
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}

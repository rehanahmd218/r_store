import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:r_store/utils/exceptions/firebase_Exceptions.dart';

Future<T> runFirebaseSafely<T>(Future<T> Function() request) async {
  try {
    return await request();
  } on FirebaseAuthException catch (e) {
    throw RFirebaseAuthException(e);
  } on FirebaseException catch (e) {
    throw RFirebaseException(e);
  } on PlatformException catch (e) {
    throw RPlatformChannelException(e);
  } catch (e) {
    throw Exception('An unexpected error occurred: $e');
  }
}

// Future<T> runOnlineRequestSafely<T>(Future<T> Function() request, String animationText, GlobalKey<FormState> formState,{String animationPath=RImages.loaderDocerAnimation}) async {
//   try {
//     if (!formState.currentState!.validate()) {
//       return null as T;
//     }

//     RFullScreenLoader.openLoadingDialog(
//       animationText,
//       animationPath,
//     );

//     final isConnected = await NetworkManager.instance.isConnected();
//     if (!isConnected) {
//       RLoaders.errorSnackBar(title: 'Error', message: 'No internet connection');
//       return null as T;
//     }

//     return await request();

//   } catch (e) {
//     RLoaders.errorSnackBar(title: 'Error', message: e.toString());
//     rethrow;
//   }
// }

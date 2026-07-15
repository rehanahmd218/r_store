import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

/// Base class for readable exceptions
abstract class RException implements Exception {
  final String code;
  final String message;

  RException(this.code, this.message);

  @override
  String toString() => "$runtimeType: $message";
  // @override
  // String toString() => "$runtimeType: $message";
}

/// -------------------- AUTH --------------------
class RFirebaseAuthException extends RException {
  RFirebaseAuthException(FirebaseAuthException e)
    : super(e.code, _mapAuthErrorCode(e.code));

  static String _mapAuthErrorCode(String code) {
    switch (code) {
      case 'invalid-email':
        return "The email address is not valid.";
      case 'invalid-credential':
        return "User Credentials not Correct.";
      case 'configuration-not-found':
        return "Firebase Auth is not fully configured for this app. Check that Email/Password sign-in is enabled in Firebase Console and that the Android app is registered in the correct Firebase project.";
      case 'internal-error':
        return "Firebase returned an internal configuration error. Verify your Firebase Auth setup and app registration.";
      case 'user-disabled':
        return "This account has been disabled.";
      case 'user-not-found':
        return "No user found with this email.";
      case 'wrong-password':
        return "Incorrect password entered.";
      case 'email-already-in-use':
        return "This email is already registered.";
      case 'weak-password':
        return "The password is too weak.";
      case 'operation-not-allowed':
        return "This sign-in method is not enabled.";
      default:
        return "An unexpected error occurred. Please try again.";
    }
  }
}

/// -------------------- STORAGE --------------------
class RFirebaseException extends RException {
  RFirebaseException(FirebaseException e)
    : super(e.code, _mapFirebaseErrorCode(e.code));

  static String _mapFirebaseErrorCode(String code) {
    switch (code) {
      // Storage-specific errors
      case 'object-not-found':
        return "The requested file does not exist.";
      case 'unauthorized':
        return "You don't have permission to access this file.";
      case 'canceled':
        return "File upload was canceled.";
      case 'unknown':
        return "An unknown storage error occurred.";
      // General Firebase errors
      case 'network-request-failed':
        return "Network error. Please check your internet connection.";
      case 'permission-denied':
        return "You don’t have permission to perform this action.";
      case 'unauthenticated':
        return "You must be signed in to perform this action.";
      case 'cancelled':
        return "The request was cancelled.";
      case 'unavailable':
        return "Service is currently unavailable. Try again later.";
      case 'deadline-exceeded':
        return "The request took too long. Please try again.";
      case 'data-loss':
        return "Data loss occurred. Please try again.";
      default:
        return "A Firebase error occurred. Please try again.";
    }
  }
}

/// -------------------- PLATFORM --------------------
class RPlatformChannelException extends RException {
  RPlatformChannelException(PlatformException e)
    : super(e.code, _mapPlatformErrorCode(e.code));

  static String _mapPlatformErrorCode(String code) {
    switch (code) {
      case 'NETWORK_ERROR':
        return "Network connection failed. Check your internet.";
      case 'PERMISSION_DENIED':
        return "Permission denied by platform.";
      case 'CANCELLED':
        return "The operation was cancelled.";
      default:
        return "A platform error occurred.";
    }
  }
}

/// -------------------- GENERAL FIREBASE --------------------




// ---------- Other Exception ------------------ //
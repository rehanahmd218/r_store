import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:r_store/common/requests/request_with_exception.dart';
import 'package:r_store/features/authentication/screens/login/login.dart';
import 'package:r_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:r_store/features/authentication/screens/signup/verify_email_screen.dart';
import 'package:r_store/navigation_menu.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:r_store/utils/local_storage/storage_utility.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final deviceStorage = GetStorage();

  @override
  void onReady() {
    super.onReady();
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Function to show redirect Screen
  screenRedirect() async {
    await deviceStorage.writeIfNull('isFirstTime', true);

    if (_auth.currentUser != null) {
      if (_auth.currentUser!.emailVerified) {
        await RLocalStorage.init(_auth.currentUser!.uid);
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(
          () => VerifyEmailScreen(email: _auth.currentUser!.email ?? ''),
        );
      }
    } else {
      if (deviceStorage.read('isFirstTime') == true) {
        Get.offAll(() => const OnBoardingScreen());
      } else {
        Get.offAll(() => const LoginScreen());
      }
    }
  }

  /* ----------------------- Email & Password Sign in ----------------------*/

  // [Email Authentication] - Sign in
  Future<UserCredential> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return runFirebaseSafely(() {
      return _auth.signInWithEmailAndPassword(email: email, password: password);
    });
  }

  // [Email Authentication] - Sign up

  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return runFirebaseSafely(() {
      return _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    });
  }

  // [Email Verification] - Mail Verification
  Future<void> sendEmailVerification() async {
    return runFirebaseSafely(() async {
      return _auth.currentUser?.sendEmailVerification();
    });
  }

  // Logout User
  Future<void> logout() async {
    return runFirebaseSafely(() async {
      await _auth.signOut();
      await GoogleSignIn.instance.signOut();
    });
  }

  // [ReAuthentication] - ReAuthenticate User

  // [Email Authentication] -  Forget Password

  Future<void> sendPasswordResetEmail(String email) async {
    return runFirebaseSafely(() async {
      return _auth.sendPasswordResetEmail(email: email);
    });
  }

  // [Federated identity & Sofical Sign in] --------------- */

  // [Google Authentication] - Google

  Future<UserCredential?> signInWithGoogle() async {
    return await runFirebaseSafely( () async {
      final googleSignIn = GoogleSignIn.instance;
      await googleSignIn.initialize();
      final GoogleSignInAccount userAccount = await googleSignIn
          .authenticate(scopeHint: ['email', 'profile']);
      final GoogleSignInAuthentication userAuth = userAccount.authentication;
      final authorizationScopes = [
        'https://www.googleapis.com/auth/userinfo.email',
        'https://www.googleapis.com/auth/userinfo.profile',
        'https://www.googleapis.com/auth/user.phonenumbers.read',
      ];
      // print('User Auth: $userAuth');
      final GoogleSignInClientAuthorization? authorization = await userAccount
          .authorizationClient
          .authorizationForScopes(authorizationScopes);
      // print('Authorization: $authorization');
      final credential = GoogleAuthProvider.credential(
        // accessToken: userAuth.,
        idToken: userAuth.idToken,

        accessToken: authorization?.accessToken,
        // accessToken: userAuth.
      );

      // print('Credential: $credential');

      return await FirebaseAuth.instance.signInWithCredential(credential);
          return null;
    });
  }


  Future<UserCredential?> reAuthenticateUser(String email,String password)async{
    return runFirebaseSafely(() async {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    });
  }

  // [Facebook Authentication] - Facebook

  /*--------------- /.end Federated Identity & Social Sign in --------------- */

  // [Logout User] - Valid for any authentication

  // [Delete User] - Remove user Auth and Firestore Account
}

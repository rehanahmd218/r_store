import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:r_store/data/repositories/authentication/authentication_repository.dart';
import 'package:r_store/data/repositories/user/user_repository.dart';
import 'package:r_store/data/services/controllers/network_manager.dart';
import 'package:r_store/features/authentication/models/user_model.dart';
import 'package:r_store/features/shop/screens/profile/reauth_login_form.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/constants/image_strings.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/popups/full_screen_loader.dart';
import 'package:r_store/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.isRegistered<UserController>()
      ? Get.find<UserController>()
      : Get.put(UserController());
  final userRepositoryController = Get.put(UserRepository());
  RxBool isProfileLoading = false.obs;

  // Controllers for Update Name Form
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();

  // Controller for ReAuth Login Form
  final TextEditingController verifyEmail = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> nameFormKey = GlobalKey<FormState>();
  final RxBool hidePassword = true.obs;

  final GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  final Rx<UserModel> user = UserModel.empty().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadUserData();
  }

  Future<void> loadUserData() async {
    try {
      isProfileLoading.value = true;
      UserModel? fetchedUser = await userRepositoryController.fetchUserData();
      if (fetchedUser != null) {
        // RLoaders.successSnackBar(title: 'Success', message: 'User data loaded successfully');
        user(fetchedUser);
        // print('User Data: ${user.value.toJson()}');
        firstName.text = fetchedUser.firstName;
        lastName.text = fetchedUser.lastName;
      }
      isProfileLoading.value = false;
    } catch (e) {
      isProfileLoading.value = false;
      RLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  void confirmDeleteAccount() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(RSizes.md),

      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account? This action cannot be undone.',
      textCancel: 'Cancel',
      middleTextStyle: Theme.of(Get.context!).textTheme.labelMedium,
      confirm: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: RColors.error,
          side: const BorderSide(color: RColors.error),
        ),

        onPressed: () {
          Get.back(); // Close the dialog
          deleteUserAccount();
        },
        child: Text(
          'Delete',
          style: Theme.of(
            Get.context!,
          ).textTheme.bodyMedium!.apply(color: RColors.white),
        ),
      ),

      cancel: OutlinedButton(
        onPressed: () {
          Get.back();
        },
        child: Text(
          'Cancel',
          style: Theme.of(
            Get.context!,
          ).textTheme.bodyMedium!.apply(color: RColors.primary),
        ),
      ),
    );
  }

  Future<void> updateSingleField(Map<String, dynamic> userData) async {
    try {
      if (!nameFormKey.currentState!.validate()) {
        return;
      }
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }
      RFullScreenLoader.openLoadingDialog(
        'Updating...',
        RImages.loaderDocerAnimation,
      );

      await userRepositoryController.updateUserData(userData);

      // await loadUserData(); // Reload user data after update
    } catch (e) {
      RLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      RFullScreenLoader.stopLoading();
    }
  }

  Future<void> deleteUserAccount() async {
    try {
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }
      final auth = UserRepository.instance.auth;
      if (auth.currentUser == null) {
        return;
      }

      for (var userInfo in auth.currentUser!.providerData) {
        if (userInfo.providerId == 'google.com') {
          // Google Sign-In
          // await auth.signOut();

          final creds = await AuthenticationRepository.instance
              .signInWithGoogle();
          if (creds == null) {
            RLoaders.errorSnackBar(
              title: 'Error',
              message: 'Re-authentication failed. Please try again.',
            );
            return;
          }
          RFullScreenLoader.openLoadingDialog(
            'Deleting...',
            RImages.loaderDocerAnimation,
          );
          await userRepositoryController.deleteUser();
        } else if (userInfo.providerId == 'password') {
          // Email/Password Sign-In
          // Prompt user to re-authenticate
          // This is a placeholder, implement your own re-authentication logic
          Get.to(() => const ReauthLoginForm());
          return;
        }
      }
      // RFullScreenLoader.openLoadingDialog('Deleting...', RImages.loaderDocerAnimation);
      RFullScreenLoader.stopLoading();
      // await UserRepositoryController.deleteUser();
      AuthenticationRepository.instance.screenRedirect();

      // await loadUserData(); // Reload user data after update
    } catch (e) {
      RLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  Future<void> uploadUserProfilePicture() async {
    try {
      final XFile? image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      
      );
      if (image == null) {
        return;
      }

      final String downloadLink = await UserRepository.instance
          .uploadPictureToFirebase('Rehan_Pictures/Profile_Pictures', image);

      
      await updateSingleField({'Profile Picture': downloadLink});

     
      user.update((val) {
        val?.profilePicture = downloadLink;
      });
      
      RLoaders.successSnackBar(title: 'Success', message: 'Profile picture updated successfully.');
    } catch (e) {
      RLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  Future<void> deleteEmailSignedInUser() async {
    try {
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }
      if (!reAuthFormKey.currentState!.validate()) {
        return;
      }

      RFullScreenLoader.openLoadingDialog(
        'Re-authenticating...',
        RImages.loaderDocerAnimation,
      );

      if (await AuthenticationRepository.instance.reAuthenticateUser(
            verifyEmail.text.trim(),
            password.text.trim(),
          ) ==
          null) {
        return;
      }
      await userRepositoryController.deleteUser();
      AuthenticationRepository.instance.screenRedirect();
      // Email/Password Sign-In
      // Prompt user to re-authenticate
      // This is a placeholder, implement your own re-authentication logic

      // await loadUserData(); // Reload user data after update
    } catch (e) {
      RLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      RFullScreenLoader.stopLoading();
    }
  }

  void saveUserRecord(UserCredential? userCreds) async {
    await loadUserData();

    if (user.value.id.isNotEmpty) {
      print('Not saving data for user again ${user.value.id}');
      return;
    }
    // print('Saving user data for the first time...');

    if (userCreds != null) {
      String uid = userCreds.user!.uid;
      String email = userCreds.user!.email ?? '';
      String name = userCreds.user!.displayName ?? '';
      final nameParts = UserModel.nameParts(name);
      String firstName = nameParts[0];
      String lastName = nameParts[1];
      String phoneNo = userCreds.user!.phoneNumber ?? '';

      String profilePic = userCreds.user!.photoURL ?? '';

      // print('User ID: $uid');
      // print('User Email: $email');
      // print('User Name: $name');
      // print('User Profile Pic: $profilePic');

      UserModel user = UserModel(
        id: uid,
        email: email,
        firstName: firstName,
        lastName: lastName,
        profilePicture: profilePic,
        phoneNo: phoneNo,
        username: UserModel.generateUserName(name),
      );
      userRepositoryController.saveUserData(user);
    }
  }
}

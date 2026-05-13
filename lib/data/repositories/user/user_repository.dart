import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:r_store/common/requests/request_with_exception.dart';
import 'package:r_store/features/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseAuth auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserData(UserModel user) async {
    return runFirebaseSafely(() {
      return _firestore
          .collection('rehan_users')
          .doc(user.id)
          .set(user.toJson());
    });
  }

  Future<UserModel?> fetchUserData() async {
    return runFirebaseSafely(() async {
      DocumentSnapshot doc = await _firestore
          .collection('rehan_users')
          .doc(auth.currentUser?.uid)
          .get();
      if (doc.exists) {
        return UserModel.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    });
  }

  Future<void> updateUserData(Map<String, dynamic> userData) async {
    return runFirebaseSafely(() {
      return _firestore
          .collection('rehan_users')
          .doc(auth.currentUser?.uid)
          .update(userData);
    });
  }

  Future<void> deleteUser() async {
    return runFirebaseSafely(() async {
      // Delete user data from Firestore
      await _firestore
          .collection('rehan_users')
          .doc(auth.currentUser?.uid)
          .delete();
      // Delete user from Firebase Authentication
      await auth.currentUser?.delete();
    });
  }

  Future<String> uploadPictureToFirebase(String path, XFile file) async {
    return runFirebaseSafely(() async {
      // Create a reference to the location you want to upload to in Firebase Storage
      final storageRef = FirebaseStorage.instance.ref(path).child(file.name);
    
      // Upload the file to Firebase Storage
      await storageRef.putFile(File(file.path));
      
    
      // Wait for the upload to complete

      // Get the download URL of the uploaded file
      final downloadUrl = await storageRef.getDownloadURL();

      return downloadUrl;
    });
  }
}

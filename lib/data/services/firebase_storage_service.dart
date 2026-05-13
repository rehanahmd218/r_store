import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:r_store/common/requests/request_with_exception.dart';

class RFirebaseStorageService extends GetxService {
  static RFirebaseStorageService get instance => Get.find();

  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<Uint8List?> getImgData(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer.asUint8List(
        byteData.offsetInBytes,
        byteData.lengthInBytes,
      );
      return imageData;
    } catch (e) {
      throw Exception('File retrieval failed: $e');
    }
  }

  Future<String?> uploadImgData(
    String path,
    String fileName,
    Uint8List fileData,
  ) async {
    return runFirebaseSafely(() async {
      Reference ref = _storage.ref(path).child(fileName);

      UploadTask uploadTask = ref.putData(fileData);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    });
  }

  Future<void> deleteFile(String fileUrl) async {
    try {
      Reference ref = _storage.refFromURL(fileUrl);
      await ref.delete();
    } catch (e) {
      throw Exception('File deletion failed: $e');
    }
  }

  Future<String?> uploadImgFile(String path, XFile file) async {
    return runFirebaseSafely(() async {
      Reference ref = _storage.ref(path).child(file.name);
      UploadTask uploadTask = ref.putFile(File(file.path));
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    });
  }
}

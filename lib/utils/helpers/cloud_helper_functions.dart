import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RCloudHelperFunctions {
  // static Future<String> uploadImageToCloud(File imageFile

  static Widget? checkSingleREcordState<T>(AsyncSnapshot<T> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    } else if (!snapshot.hasData ||
        (snapshot.data is List && (snapshot.data as List).isEmpty)) {
      return const Center(child: Text('No data available'));
    }
    return null; // Data is available
  }

  static Widget? checkMultiRecordState<T>(
    {
    required AsyncSnapshot<T> snapshot,
    Widget? loader,
    Widget? error,
    Widget? nothingFound,
  }) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return loader ?? const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return error ?? Center(child: Text('Error: ${snapshot.error}'));
    } else if (!snapshot.hasData) {
      return nothingFound ?? const Center(child: Text('No data available'));
    }
    return null; // Data is available
  }

  static Future<String> getURKFromFirePAthAndName(String path) async {
    try {
      if (path.isEmpty) {
        return '';
      }

      final ref = FirebaseStorage.instance.ref().child(path);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      return '';
    }
  }
}

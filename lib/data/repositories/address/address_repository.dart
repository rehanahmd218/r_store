import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:r_store/common/requests/request_with_exception.dart';
import 'package:r_store/features/shop/models/address_mode.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<AddressModel>> getAllAddresses(String userId) async {
    return runFirebaseSafely(() async {
      final snapshot = await _db
          .collection('rehan_users')
          .doc(userId)
          .collection('addresses')
          .get();
      return snapshot.docs
          .map((doc) => AddressModel.fromDocumentSnapshot(doc))
          .toList();
    });
  }

  Future<String> addSingleAddress(String userId, AddressModel address) async {
    return runFirebaseSafely(() async {
      DocumentReference docRef = await _db
          .collection('rehan_users')
          .doc(userId)
          .collection('addresses')
          .add(address.toJson());
      return docRef.id;
    });
  }

  Future<void> updateSingleAddressField(
    String userId,
    String newId,
    String oldAddressId,
  ) async {
    return runFirebaseSafely(() async {
      if (oldAddressId.isNotEmpty) {
        await _db
            .collection('rehan_users')
            .doc(userId)
            .collection('addresses')
            .doc(oldAddressId)
            .update({'SelectedAddress': false});
      }

      await _db
          .collection('rehan_users')
          .doc(userId)
          .collection('addresses')
          .doc(newId)
          .update({'SelectedAddress': true});
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:r_store/common/requests/request_with_exception.dart';
import 'package:r_store/features/shop/models/order_model.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<List<OrderModel>> fetchUserOrders(String userId) {
    return runFirebaseSafely(() async {
      final snapshot = await _db
          .collection('rehan_users')
          .doc(userId)
          .collection('orders')
          .get();
      return snapshot.docs.map((doc) => OrderModel.fromSnapshot(doc)).toList();
    });
  }


  Future<void> saveOrder(String userId, OrderModel order) {
    return runFirebaseSafely(() async {
      await _db
          .collection('rehan_users')
          .doc(userId)
          .collection('orders')
          .doc(order.id)
          .set(order.toJson());
    });
  }
}

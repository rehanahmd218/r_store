import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewModel {
  String? reviewId;
  String description;
  double rating;
  String productId;
  DateTime reviewDate;
  String? replyId;
  String userId;
  String username;
  String userProfilePicture;

  ReviewModel(
      {required this.description,
      required this.rating,
      required this.productId,
      required this.username,
      required this.reviewDate,
      this.replyId,
      this.reviewId,
      required this.userId,
      required this.userProfilePicture});

  static ReviewModel empty() {
    return ReviewModel(
        reviewId: '',
        description: '',
        rating: 0.0,
        productId: '',
        username: '',
        reviewDate: DateTime.now(),
        userId: '',
        userProfilePicture: '');
  }

  factory ReviewModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.data() == null && snapshot.data()!.isEmpty) {
      return ReviewModel.empty();
    }
    Map<String, dynamic> data = snapshot.data()!;
    return ReviewModel(
      reviewId: data['reviewId'] ?? '',
      description: data['description'],
      username: data['username'],
      rating: data['rating'],
      productId: data['productId'],
      reviewDate: (data['reviewDate'] as Timestamp).toDate(),
      userId: data['userId'],
      userProfilePicture: data['userProfilePicture'],
      replyId: data['replyId'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> review = {
      'reviewId': reviewId,
      'description': description,
      'rating': rating,
      'username': username,
      'productId': productId,
      'reviewDate': reviewDate,
      'userId': userId,
      'userProfilePicture': userProfilePicture,
      'replyId': replyId,
    };
    return review;
  }
}

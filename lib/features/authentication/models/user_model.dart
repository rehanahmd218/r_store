import 'package:r_store/utils/formatters/formatter.dart';

class UserModel {
  String id;
  String email;
  String firstName;
  String lastName;
  String phoneNo;
  String username;
  String profilePicture;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNo,
    required this.username,
    required this.profilePicture,
  });

  String get fullName => '$firstName $lastName';

  String get formattedPhoneNo => RFormatters.formatPhoneNumber(phoneNo);

  static List<String> nameParts(fullName) => fullName.split(' ');

  static String generateUserName(fullName) {
    List<String> parts = nameParts(fullName);
    String firstPart = parts.isNotEmpty ? parts[0].toLowerCase() : '';
    String lastPart = parts.length > 1 ? parts[1].toLowerCase() : '';
    return 'cwr_$firstPart$lastPart';
  }



  static UserModel empty() => UserModel(
    id: '',
    email: '',
    firstName: '',
    lastName: '',
    phoneNo: '',
    username: '',
    profilePicture: '',
  );

  // Convert UserModel to Map
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Email': email,
      'First Name': firstName,
      'Last Name': lastName,
      'Phone No': phoneNo,
      'Username': username,
      'Profile Picture': profilePicture,
    };
  }

  // Convert Map to UserModel
  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['Id'] ?? '',
      email: map['Email'] ?? '',
      firstName: map['First Name'] ?? '',
      lastName: map['Last Name'] ?? '',
      phoneNo: map['Phone No'] ?? '',
      username: map['Username'] ?? '',
      profilePicture: map['Profile Picture'] ?? '',
    );
  }
}
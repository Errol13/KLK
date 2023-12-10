import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String lastName;
  final String firstName;
  final String? middleName;
  final String email;
  final DateTime birthDate;
  bool isAdmin = false;

  UserModel({
    required this.lastName,
    required this.firstName,
    this.middleName,
    required this.birthDate,
    required this.email,
    this.isAdmin = false,
  });

  Map<String, dynamic> toJson() => {
        "LastName": lastName,
        "FirstName": firstName,
        "MiddleName": middleName,
        "Birthdate": birthDate,
        "Email": email,
        "isAdmin": isAdmin,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['FirstName'] ?? '', // Provide a default value if it's null
      lastName: json['LastName'] ?? '', // Provide a default value if it's null
      middleName: json['MiddleName'] ?? '', // Provide a default value if it's null
      birthDate: (json['Birthdate'] as Timestamp?)?.toDate() ?? DateTime(1970),
      email: json['Email'] ?? '', // Provide a default value if it's null
    );
  }
}

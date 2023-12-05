class UserModel{

  final String lastName;
  final String firstName;
  final String? middleName;
  final String email;
  final DateTime birthDate;
  
  UserModel({
    required this.lastName,
    required this.firstName,
    this.middleName,
    required this.birthDate,
    required this.email,
  });

  Map <String, dynamic> toJson()  =>{
      "LastName": lastName,
      "FirstName": firstName,
      "MiddleName": middleName,
      "Birthdate": birthDate,
      "Email": email,
    };
}
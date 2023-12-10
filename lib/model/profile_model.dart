class Profile {
  final String userId;
  String profilePicture;
  String sex;
  String location;
  String bloodType;
  String maritalStatus;
  String occupation;

  Profile({
    required this.userId,
    this.profilePicture = 'assets/user.png',
    this.sex = '',
    this.location = '',
    this.bloodType = '',
    this.maritalStatus = '',
    this.occupation = '',
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      userId: json['userId'] ?? '',
      profilePicture:
          json['profilePicture'] ?? 'assets/user.png.png',
      sex: json['sex'] ?? '',
      location: json['location'] ?? '',
      bloodType: json['bloodType'] ?? '',
      maritalStatus: json['maritalStatus'] ?? '',
      occupation: json['occupation'] ?? '',
    );
  }
}

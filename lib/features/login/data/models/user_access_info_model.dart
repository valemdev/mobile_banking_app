class UserAccessInfo {
  final String uid;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String imageUrl;
  final String token;

  UserAccessInfo({
    required this.uid,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.imageUrl,
    required this.token,
  });

  factory UserAccessInfo.fromJson(Map<String, dynamic> json) {
    return UserAccessInfo(
      uid: json['uid'],
      username: json['username'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      imageUrl: json['image'],
      token: json['token'],
    );
  }
}

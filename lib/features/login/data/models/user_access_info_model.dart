class UserAccessInfo {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String accessToken;
  final String refreshToken;

  UserAccessInfo({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.accessToken,
    required this.refreshToken,
  });

  factory UserAccessInfo.fromJson(Map<String, dynamic> json) {
    return UserAccessInfo(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}

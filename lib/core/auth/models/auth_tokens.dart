class AuthTokens {
  final String token;

  const AuthTokens({
    required this.token,
  });

  factory AuthTokens.fromJson(Map<String, dynamic> json) {
    return AuthTokens(token: json['token'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'token': token};
  }
}

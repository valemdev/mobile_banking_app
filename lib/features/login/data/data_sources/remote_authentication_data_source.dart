import 'package:mobile_banking_app/core/network/api_client.dart';
import 'package:mobile_banking_app/features/login/data/models/user_model.dart';
import 'package:mobile_banking_app/features/login/data/models/user_password_model.dart';

class RemoteAuthenticationDataSource {
  final apiClient = ApiClient(
    baseUrl: 'https://dummyjson.com',
    enableLogs: true,
  );
  Future<UserModel> login(UserPasswordModel userPassword) async {
    final String email = userPassword.email;
    final String password = userPassword.password;
    print("Attempting login with email: $email and password: $password");
    final response = await apiClient.post("/auth/login", data: {
      "username": email,
      "password": password,
    });

    print(response.data);

    return UserModel.fromJson(response.data);
  }
}

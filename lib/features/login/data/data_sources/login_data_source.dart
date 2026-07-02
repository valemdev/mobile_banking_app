import 'package:mobile_banking_app/core/network/api_client.dart';
import 'package:mobile_banking_app/features/login/data/models/user_access_info_model.dart';

class LoginDataSource {
  final apiClient = ApiClient(
    baseUrl: 'https://dummyjson.com',
    enableLogs: true,
  );

  Future<UserAccessInfo> login(email, password) async {
    final response = await apiClient.post(
      '/auth/login',
      data: {
        'username': email,
        'password': password,
        'expiresInMins': 60,
      },
    );

    if (response.statusCode == 200) {
      final userAccessInfo = UserAccessInfo.fromJson(response.data);
      return userAccessInfo;
    }
    throw Exception('Failed to login');
  }
}

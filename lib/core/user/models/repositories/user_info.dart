import 'package:mobile_banking_app/core/user/models/user.dart';

abstract class UserInfoRepository {
  Future<void> saveUserInfo(User user);
  Future<User?> getUserInfo();
  Future<void> deleteUserInfo();
}

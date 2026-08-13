import 'package:mobile_banking_app/core/user/repositories/shared_prefs_user_info_repository.dart';
import 'package:mobile_banking_app/features/home/domain/repositories/userInfo_repository.dart';
import 'package:mobile_banking_app/features/home/domain/entities/user_entity.dart';

class UserInfoRepositoryImpl implements UserInfoRepository {
  final SharedPrefsUserInfoRepository _localDataSource;

  UserInfoRepositoryImpl({SharedPrefsUserInfoRepository? localDataSource})
      : _localDataSource = localDataSource ?? SharedPrefsUserInfoRepository();
  @override
  Future<UserEntity> getUserInfo() async {
    try {
      final userInfo = await _localDataSource.getUserInfo();
      if (userInfo == null) {
        throw Exception('No user info found');
      }
      return UserEntity(
        name: userInfo.name,
        imageUrl: userInfo.imageUrl,
      );
    } catch (e) {
      throw Exception('Failed to get user info: $e');
    }
  }
}

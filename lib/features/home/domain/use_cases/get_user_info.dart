import 'package:mobile_banking_app/core/user/models/repositories/user_info.dart';
import 'package:mobile_banking_app/core/user/repositories/shared_prefs_user_info_repository.dart';
import 'package:mobile_banking_app/features/home/domain/entities/user_entity.dart';

class GetUserInfoUseCase {
  final UserInfoRepository _userInfoRepository;

  GetUserInfoUseCase({UserInfoRepository? userInfoRepository})
      : _userInfoRepository =
            userInfoRepository ?? SharedPrefsUserInfoRepository();

  Future<UserEntity> call() async {
    final userInfo = await _userInfoRepository.getUserInfo();

    if (userInfo == null) {
      throw Exception('User information not found');
    }

    return UserEntity(imageUrl: userInfo.imageUrl, name: userInfo.name);
  }
}

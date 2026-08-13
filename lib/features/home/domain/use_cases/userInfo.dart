import 'package:mobile_banking_app/features/home/data/repositories/userinfo_repository.dart';
import 'package:mobile_banking_app/features/home/domain/entities/user_entity.dart';
import 'package:mobile_banking_app/features/home/domain/repositories/userInfo_repository.dart';

class UserInfoUseCase {
  final UserInfoRepository _userInfoRepository;

  UserInfoUseCase({UserInfoRepository? userInfoRepository})
      : _userInfoRepository = userInfoRepository ?? UserInfoRepositoryImpl();

  Future<UserEntity> call() async {
    return await _userInfoRepository.getUserInfo();
  }
}

import 'package:mobile_banking_app/features/home/domain/entities/user_entity.dart';

abstract class UserInfoRepository {
  Future<UserEntity> getUserInfo();
}

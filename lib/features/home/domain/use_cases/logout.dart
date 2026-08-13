import 'package:mobile_banking_app/features/home/data/repositories/logout_repository.dart';
import 'package:mobile_banking_app/features/home/domain/repositories/logout_repository.dart';

class LogoutUseCase {
  final LogoutRepository _userInfoRepository;

  LogoutUseCase({LogoutRepository? logoutRepository})
      : _userInfoRepository = logoutRepository ?? LogoutRepositoryImpl();

  Future<void> call() async {
    return await _userInfoRepository.logout();
  }
}

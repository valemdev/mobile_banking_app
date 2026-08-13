import 'package:mobile_banking_app/core/auth/repositories/shared_prefs_token_repository.dart';
import 'package:mobile_banking_app/core/user/repositories/shared_prefs_user_info_repository.dart';
import 'package:mobile_banking_app/features/home/data/data_sources/logout_data_source.dart';
import 'package:mobile_banking_app/features/home/domain/repositories/logout_repository.dart';

class LogoutRepositoryImpl implements LogoutRepository {
  final SharedPrefsUserInfoRepository _localDataSource;
  final LogoutDataSource _logoutDataSource;
  final SharedPrefsTokenRepository _logoutLocalAuthRepository;

  LogoutRepositoryImpl(
      {SharedPrefsUserInfoRepository? localDataSource,
      LogoutDataSource? logoutDataSource,
      SharedPrefsTokenRepository? logoutLocalAuthRepository})
      : _localDataSource = localDataSource ?? SharedPrefsUserInfoRepository(),
        _logoutDataSource = logoutDataSource ?? LogoutDataSource(),
        _logoutLocalAuthRepository =
            logoutLocalAuthRepository ?? SharedPrefsTokenRepository();
  @override
  Future<void> logout() async {
    try {
      await _localDataSource.deleteUserInfo();
      await _logoutLocalAuthRepository.deleteTokens();
      await _logoutDataSource.logout();
    } catch (e) {
      throw Exception('Failed to logout: $e');
    }
  }
}

import 'package:mobile_banking_app/core/auth/models/repositories/token_repository.dart';
import 'package:mobile_banking_app/core/auth/repositories/shared_prefs_token_repository.dart';
import 'package:mobile_banking_app/core/user/models/repositories/user_info.dart';
import 'package:mobile_banking_app/core/user/repositories/shared_prefs_user_info_repository.dart';

class LogoutUseCase {
  final TokenRepository _tokenRepository;
  final UserInfoRepository _userInfoRepository;

  LogoutUseCase(
      {TokenRepository? tokenRepository,
      UserInfoRepository? userInfoRepository})
      : _tokenRepository = tokenRepository ?? SharedPrefsTokenRepository(),
        _userInfoRepository =
            userInfoRepository ?? SharedPrefsUserInfoRepository();

  Future<void> call() async {
    await _tokenRepository.deleteTokens();
    await _userInfoRepository.deleteUserInfo();
  }
}

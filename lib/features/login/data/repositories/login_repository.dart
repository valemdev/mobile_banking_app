import 'package:mobile_banking_app/core/auth/models/auth_tokens.dart';
import 'package:mobile_banking_app/core/auth/models/repositories/token_repository.dart';
import 'package:mobile_banking_app/core/auth/repositories/shared_prefs_token_repository.dart';
import 'package:mobile_banking_app/core/user/models/repositories/user_info.dart';
import 'package:mobile_banking_app/core/user/models/user.dart';
import 'package:mobile_banking_app/core/user/repositories/shared_prefs_user_info_repository.dart';
import 'package:mobile_banking_app/features/login/data/data_sources/login_data_source.dart';
import 'package:mobile_banking_app/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource _loginDataSource;
  final TokenRepository _localLoginDataSource;
  final UserInfoRepository _userInfoRepository;
  LoginRepositoryImpl(
      {LoginDataSource? loginDataSource,
      TokenRepository? localLoginDataSource,
      UserInfoRepository? userInfoRepository})
      : _loginDataSource = loginDataSource ?? LoginDataSource(),
        _localLoginDataSource =
            localLoginDataSource ?? SharedPrefsTokenRepository(),
        _userInfoRepository =
            userInfoRepository ?? SharedPrefsUserInfoRepository();

  @override
  Future<void> login(String username, String password) async {
    final tokenAlreadyExists = await _localLoginDataSource.getTokens();
    if (tokenAlreadyExists != null) {
      await _localLoginDataSource.deleteTokens();
      throw Exception('User already logged in');
    }

    final response = await _loginDataSource.login(username, password);
    final userInfo = User(
      id: response.id,
      username: response.username,
      email: response.email,
      firstName: response.firstName,
      lastName: response.lastName,
      gender: response.gender,
      imageUrl: response.imageUrl,
    );
    final tokens = AuthTokens(
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
    );
    await _localLoginDataSource.saveTokens(tokens);
    await _userInfoRepository.saveUserInfo(userInfo);
  }
}

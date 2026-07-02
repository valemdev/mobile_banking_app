import 'package:mobile_banking_app/core/auth/models/auth_tokens.dart';
import 'package:mobile_banking_app/core/auth/models/repositories/token_repository.dart';
import 'package:mobile_banking_app/core/auth/repositories/shared_prefs_token_repository.dart';
import 'package:mobile_banking_app/features/login/data/data_sources/login_data_source.dart';
import 'package:mobile_banking_app/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource _loginDataSource;
  final TokenRepository _localLoginDataSource;
  LoginRepositoryImpl(
      {LoginDataSource? loginDataSource, TokenRepository? localLoginDataSource})
      : _loginDataSource = loginDataSource ?? LoginDataSource(),
        _localLoginDataSource =
            localLoginDataSource ?? SharedPrefsTokenRepository();

  @override
  Future<void> login(String username, String password) async {
    final tokenAlreadyExists = await _localLoginDataSource.getTokens();
    if (tokenAlreadyExists != null) {
      await _localLoginDataSource.deleteTokens();
      throw Exception('User already logged in');
    }

    final userAccessInfo = await _loginDataSource.login(username, password);
    final tokens = AuthTokens(
      accessToken: userAccessInfo.accessToken,
      refreshToken: userAccessInfo.refreshToken,
    );
    print('Access Token: ${tokens.accessToken}');
    await _localLoginDataSource.saveTokens(tokens);
  }
}

import 'package:mobile_banking_app/features/login/data/data_sources/local_login.dart';
import 'package:mobile_banking_app/features/login/data/data_sources/login_data_source.dart';
import 'package:mobile_banking_app/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource _loginDataSource;
  final LocalLoginDataSource _localLoginDataSource;
  LoginRepositoryImpl(
      {LoginDataSource? loginDataSource,
      LocalLoginDataSource? localLoginDataSource})
      : _loginDataSource = loginDataSource ?? LoginDataSource(),
        _localLoginDataSource = localLoginDataSource ?? LocalLoginDataSource();

  @override
  Future<void> login(String username, String password) async {
    final tokenAlreadyExists = await _localLoginDataSource.getToken();
    if (tokenAlreadyExists != null) {
      await _localLoginDataSource.deleteToken();
      throw Exception('User already logged in');
    }

    final token = await _loginDataSource.login(username, password);
    await _localLoginDataSource.setToken(token);
  }
}
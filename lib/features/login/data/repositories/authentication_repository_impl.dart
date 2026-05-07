import 'package:mobile_banking_app/features/login/data/data_sources/local_authentication_data_source.dart';
import 'package:mobile_banking_app/features/login/data/data_sources/remote_authentication_data_source.dart';
import 'package:mobile_banking_app/features/login/data/models/user_model.dart';
import 'package:mobile_banking_app/features/login/data/models/user_password_model.dart';
import 'package:mobile_banking_app/features/login/domain/entities/user_entity.dart';
import 'package:mobile_banking_app/features/login/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final RemoteAuthenticationDataSource _remoteDataSource;
  final LocalAuthenticationDataSource _localDataSource;

  AuthenticationRepositoryImpl({
    RemoteAuthenticationDataSource? remoteDataSource,
    required LocalAuthenticationDataSource localDataSource,
  })  : _remoteDataSource =
            remoteDataSource ?? RemoteAuthenticationDataSource(),
        _localDataSource = localDataSource;

  @override
  Future<User> login(String email, String password) async {
    final UserPasswordModel userPassword =
        UserPasswordModel(email: email, password: password);

    final UserModel user = await _remoteDataSource.login(userPassword);

    if (user.token != null) {
      await _localDataSource.saveUser(user, user.token!);
    }

    return User.fromModel(user);
  }

  @override
  Future<void> logout() async {
    await _localDataSource.clearUser();
  }

  Future<User?> getStoredUser() async {
    final userModel = await _localDataSource.getUser();
    if (userModel == null) return null;
    return User.fromModel(userModel);
  }

  Future<String?> getStoredToken() async {
    return await _localDataSource.getToken();
  }
}

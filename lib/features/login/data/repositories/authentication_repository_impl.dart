import 'package:mobile_banking_app/features/login/data/data_sources/remote_authentication_data_source.dart';
import 'package:mobile_banking_app/features/login/data/models/user_model.dart';
import 'package:mobile_banking_app/features/login/data/models/user_password_model.dart';
import 'package:mobile_banking_app/features/login/domain/entities/user_entity.dart';
import 'package:mobile_banking_app/features/login/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final RemoteAuthenticationDataSource _remoteDataSource;

  AuthenticationRepositoryImpl(
      {RemoteAuthenticationDataSource? remoteDataSource})
      : _remoteDataSource =
            remoteDataSource ?? RemoteAuthenticationDataSource();

  @override
  Future<User> login(String email, String password) async {
    final UserPasswordModel userPassword =
        UserPasswordModel(email: email, password: password);

    final UserModel user = await _remoteDataSource.login(userPassword);
    return User.fromModel(user);
  }

  @override
  Future<void> logout() async {
    // Implement logout logic here
  }
}

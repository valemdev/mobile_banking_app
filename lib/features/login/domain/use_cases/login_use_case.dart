import 'package:mobile_banking_app/features/login/data/repositories/authentication_repository_impl.dart';
import 'package:mobile_banking_app/features/login/domain/entities/user_entity.dart';
import 'package:mobile_banking_app/features/login/domain/repositories/authentication_repository.dart';

class LoginUseCase {
  final AuthenticationRepository _authRepository;

  LoginUseCase({AuthenticationRepository? authRepository})
      : _authRepository = authRepository ??
            AuthenticationRepositoryImpl(
              localDataSource:
                  throw Exception('LocalDataSource must be provided'),
            );

  Future<User> call(String email, String password) async {
    return await _authRepository.login(email, password);
  }

  Future<void> logout() async {
    return await _authRepository.logout();
  }

  Future<User?> getStoredUser() async {
    if (_authRepository is AuthenticationRepositoryImpl) {
      return await (_authRepository as AuthenticationRepositoryImpl)
          .getStoredUser();
    }
    return null;
  }
}

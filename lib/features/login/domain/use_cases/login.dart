import 'package:mobile_banking_app/features/login/data/repositories/login_repository.dart';
import 'package:mobile_banking_app/features/login/domain/repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository _loginRepository;

  LoginUseCase({LoginRepository? loginRepository})
      : _loginRepository = loginRepository ?? LoginRepositoryImpl();

  Future<void> call(String username, String password) async {
    await _loginRepository.login(username, password);
  }
}

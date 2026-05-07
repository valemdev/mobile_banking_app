import 'package:mobile_banking_app/features/login/domain/entities/user_entity.dart';

abstract class AuthenticationRepository {
  Future<User> login(String email, String password);
  Future<void> logout();
}

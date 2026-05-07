import 'package:mobile_banking_app/features/login/data/models/user_model.dart';
import 'package:mobile_banking_app/features/login/data/models/user_password_model.dart';

class RemoteAuthenticationDataSource {
  Future<UserModel> login(UserPasswordModel userPassword) async {
    final String email = userPassword.email;
    final String password = userPassword.password;

    if (email == 'correo@gmail.com' && password == '123456') {
      await Future.delayed(const Duration(seconds: 1));
      return UserModel(
        id: '123',
        name: 'Quesito',
        email: email,
      );
    } else {
      throw Exception('Invalid email or password gay');
    }
  }
}

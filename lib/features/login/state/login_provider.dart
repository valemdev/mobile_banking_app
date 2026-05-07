import 'package:flutter/material.dart';
import 'package:mobile_banking_app/features/login/domain/use_cases/login_use_case.dart';

class LoginProvider extends ChangeNotifier {
  final LoginUseCase _loginUseCase;

  LoginProvider(LoginUseCase? loginUseCase)
      : _loginUseCase = loginUseCase ?? LoginUseCase();

  String title = "Login";
  bool loggedIn = false;
  int loginAttempts = 0;

  void updateTitle(String newTitle) {
    loginAttempts++;
    title = "$newTitle and Attempts = $loginAttempts";
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    title = "Logging in...";
    notifyListeners();

    try {
      final user = await _loginUseCase.call(username, password);
      title = " Welcome, ${user.name}!";
      loggedIn = true;
      notifyListeners();
      return true;
    } catch (e) {
      title = "Login Failed: ${e.toString()}";
      loggedIn = false;
      notifyListeners();
      return false;
    }
  }
}

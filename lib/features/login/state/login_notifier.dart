import 'package:flutter_riverpod/legacy.dart';
import 'package:mobile_banking_app/features/login/domain/use_cases/login_use_case.dart';
import 'package:mobile_banking_app/features/login/state/login_state.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) => LoginNotifier(),
);

class LoginNotifier extends StateNotifier<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginNotifier({LoginUseCase? loginUseCase})
      : _loginUseCase = loginUseCase ?? LoginUseCase(),
        super(LoginInitialState());

  Future<bool> login(String username, String password) async {
    state = LoginLoadingState();
    try {
      final user = await _loginUseCase.call(username, password);
      state = LoginSuccessState(user.name);
      return true;
    } catch (e) {
      state = LoginErrorState("Login Failed: ${e.toString()}");
      return false;
    }
  }

  Future<void> logout() async {
    try {
      await _loginUseCase.logout();
      state = LoginInitialState();
    } catch (e) {
      // Even if logout fails, reset the state
      state = LoginInitialState();
    }
  }
}

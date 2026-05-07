import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:mobile_banking_app/features/login/state/auth_provider.dart';
import 'package:mobile_banking_app/features/login/state/login_state.dart';
import 'package:mobile_banking_app/features/login/domain/use_cases/login_use_case.dart';

final loginNotifierProvider =
    StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(ref);
});

class LoginNotifier extends StateNotifier<LoginState> {
  final Ref _ref;

  LoginNotifier(this._ref) : super(const LoginState.initial());

  Future<bool> login(String email, String password) async {
    // Validate inputs
    const emailError = null; // ValidationHelper.validateEmail(email);
    final passwordError = ValidationHelper.validatePassword(password);

    if (emailError != null) {
      state = LoginState.error(errorMessage: emailError);
      return false;
    }

    if (passwordError != null) {
      state = LoginState.error(errorMessage: passwordError);
      return false;
    }

    state = const LoginState.loading();
    try {
      final authRepo = await _ref.watch(authRepositoryProvider.future);
      final loginUseCase = LoginUseCase(authRepository: authRepo);

      final user = await loginUseCase.call(email, password);
      _ref.invalidate(storedUserProvider);
      _ref.invalidate(storedUserProvider);
      state = LoginState.success(userName: user.name);
      return true;
    } catch (e) {
      if (e.toString().contains("Invalid credentials")) {
        state = const LoginState.error(
          errorMessage:
              "Credenciales inválidas. Por favor, inténtalo de nuevo.",
        );
        return false;
      }
      state = LoginState.error(
        errorMessage: "Error de login: ${e.toString()}",
      );
      return false;
    }
  }

  Future<void> logout() async {
    try {
      final authRepo = await _ref.watch(authRepositoryProvider.future);
      final loginUseCase = LoginUseCase(authRepository: authRepo);
      await loginUseCase.logout();
      _ref.invalidate(storedUserProvider);
      state = const LoginState.initial();
    } catch (e) {
      _ref.invalidate(storedUserProvider);
      state = const LoginState.initial();
    }
  }
}

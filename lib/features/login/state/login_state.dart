import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitialState;
  const factory LoginState.loading() = LoginLoadingState;
  const factory LoginState.success({required String userName}) =
      LoginSuccessState;
  const factory LoginState.error({required String errorMessage}) =
      LoginErrorState;

  const LoginState._();

  String get title => when(
        initial: () => 'Login',
        loading: () => 'Haciendo login...',
        success: (userName) => 'Bienvenido $userName',
        error: (errorMessage) => errorMessage,
      );

  bool get logged => when(
        initial: () => false,
        loading: () => false,
        success: (_) => true,
        error: (_) => false,
      );

  bool get isLoading => when(
        initial: () => false,
        loading: () => true,
        success: (_) => false,
        error: (_) => false,
      );
}

class ValidationHelper {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'El email es requerido';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Por favor ingrese un email válido';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'La contraseña es requerida';
    }

    if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }

    return null;
  }
}

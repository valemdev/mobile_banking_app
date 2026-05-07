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
}

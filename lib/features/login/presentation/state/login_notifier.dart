import 'package:mobile_banking_app/features/login/domain/use_cases/login.dart';
import 'package:mobile_banking_app/features/login/presentation/state/login_state.dart';
import 'package:riverpod/legacy.dart';

final loginNotifierProvider = StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) => LoginNotifier(),
);

class LoginNotifier extends StateNotifier<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginNotifier({LoginUseCase? loginUseCase})
      : _loginUseCase = loginUseCase ?? LoginUseCase(),
        super(LoginInitialState('', ''));

  Future<void> login(String email, String password) async {
    state = LoginLoadingState(email, password);
    try {
      await _loginUseCase.call(email, password);
      state = LoginSuccessState(email, password);
    } catch (e) {
      state = LoginErrorState(email, password, e.toString());
    }
  }
}

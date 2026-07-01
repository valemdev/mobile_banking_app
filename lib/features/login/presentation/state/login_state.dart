abstract class LoginState {
  final String email;
  final String password;

  const LoginState( this.email,  this.password);
}

class LoginInitialState extends LoginState {
  LoginInitialState(super.email, super.password);
}

class LoginLoadingState extends LoginState {
  LoginLoadingState(super.email, super.password);
}

class LoginErrorState extends LoginState {
  final String errorMessage;

  LoginErrorState(super.email, super.password, this.errorMessage);
}

class LoginSuccessState extends LoginState {
  LoginSuccessState(super.email, super.password);
}
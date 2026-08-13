import 'package:mobile_banking_app/features/home/domain/entities/user_entity.dart';

abstract class UserState {
  final UserEntity user;

  const UserState(this.user);
}

class UserInitialState extends UserState {
  UserInitialState(super.user);
}

class UserLoadingState extends UserState {
  UserLoadingState(super.user);
}

class UserErrorState extends UserState {
  final String errorMessage;

  UserErrorState(super.user, this.errorMessage);
}

class UserSuccessState extends UserState {
  UserSuccessState(super.user);
}

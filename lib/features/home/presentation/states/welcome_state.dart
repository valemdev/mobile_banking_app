import 'package:mobile_banking_app/features/home/domain/entities/user_entity.dart';

abstract class WelcomeState {
  late final UserEntity user;
  WelcomeState({required this.user});
}

class WelcomeInitialState extends WelcomeState {
  WelcomeInitialState({required super.user});
}

class WelcomeLoadingState extends WelcomeState {
  WelcomeLoadingState({required super.user});
}

class WelcomeLoadedState extends WelcomeState {
  WelcomeLoadedState({required super.user});
}

class WelcomeErrorState extends WelcomeState {
  final String errorMessage;

  WelcomeErrorState({required this.errorMessage, required super.user});
}

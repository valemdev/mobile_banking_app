import 'package:mobile_banking_app/features/home/domain/entities/user_entity.dart';
import 'package:mobile_banking_app/features/home/domain/use_cases/logout.dart';
import 'package:mobile_banking_app/features/home/domain/use_cases/userInfo.dart';
import 'package:mobile_banking_app/features/home/presentation/state/user_state.dart';
import 'package:riverpod/legacy.dart';

final userNotifierProvider = StateNotifierProvider<UserNotifier, UserState>(
  (ref) => UserNotifier(),
);

class UserNotifier extends StateNotifier<UserState> {
  final UserInfoUseCase _userInfoUseCase;
  final LogoutUseCase _logoutUseCase;

  UserNotifier({UserInfoUseCase? userInfoUseCase, LogoutUseCase? logoutUseCase})
      : _userInfoUseCase = userInfoUseCase ?? UserInfoUseCase(),
        _logoutUseCase = logoutUseCase ?? LogoutUseCase(),
        super(UserInitialState(UserEntity(
          imageUrl: '',
          name: '',
        )));
  Future<void> fetchUserInfo() async {
    state = UserLoadingState(UserEntity(
      imageUrl: '',
      name: '',
    ));
    try {
      final userInfo = await _userInfoUseCase.call();
      state = UserSuccessState(userInfo);
    } catch (e) {
      state = UserErrorState(
          UserEntity(
            imageUrl: '',
            name: '',
          ),
          e.toString());
    }
  }

  Future<void> logout() async {
    state = UserLoadingState(UserEntity(
      imageUrl: '',
      name: '',
    ));
    try {
      await _logoutUseCase.call();
      state = UserInitialState(UserEntity(
        imageUrl: '',
        name: '',
      ));
    } catch (e) {
      state = UserErrorState(
          UserEntity(
            imageUrl: '',
            name: '',
          ),
          e.toString());
    }
  }
}

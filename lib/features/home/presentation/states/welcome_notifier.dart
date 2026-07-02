import 'package:mobile_banking_app/features/home/domain/entities/user_entity.dart';
import 'package:mobile_banking_app/features/home/domain/use_cases/get_user_info.dart';
import 'package:mobile_banking_app/features/home/presentation/states/welcome_state.dart';
import 'package:riverpod/legacy.dart';
import 'package:mobile_banking_app/core/auth/repositories/shared_prefs_token_repository.dart';
import 'package:mobile_banking_app/core/user/repositories/shared_prefs_user_info_repository.dart';

final welcomeNotifierProvider =
    StateNotifierProvider<WelcomeNotifier, WelcomeState>((ref) {
  return WelcomeNotifier();
});

class WelcomeNotifier extends StateNotifier<WelcomeState> {
  final GetUserInfoUseCase _getUserInfoUseCase;

  WelcomeNotifier()
      : _getUserInfoUseCase = GetUserInfoUseCase(),
        super(WelcomeInitialState(user: UserEntity(imageUrl: '', name: ''))) {
    loadUserInfo();
  }

  Future<void> loadUserInfo() async {
    try {
      state = WelcomeLoadingState(user: state.user);
      final user = await _getUserInfoUseCase.call();
      state = WelcomeLoadedState(user: user);
    } catch (e) {
      state = WelcomeErrorState(errorMessage: e.toString(), user: state.user);
    }
  }

  Future<void> logout() async {
    try {
      await SharedPrefsTokenRepository().deleteTokens();
      await SharedPrefsUserInfoRepository().deleteUserInfo();
    } catch (e) {
      print('Error during logout: $e');
    }
  }
}

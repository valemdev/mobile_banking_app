import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_banking_app/features/login/data/data_sources/local_authentication_data_source.dart';
import 'package:mobile_banking_app/features/login/data/repositories/authentication_repository_impl.dart';
import 'package:mobile_banking_app/features/login/domain/entities/user_entity.dart';

final sharedPreferencesProvider =
    FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});

final localAuthenticationDataSourceProvider =
    FutureProvider<LocalAuthenticationDataSource>((ref) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  return LocalAuthenticationDataSourceImpl(prefs);
});

final authRepositoryProvider =
    FutureProvider<AuthenticationRepositoryImpl>((ref) async {
  final localDataSource =
      await ref.watch(localAuthenticationDataSourceProvider.future);
  return AuthenticationRepositoryImpl(localDataSource: localDataSource);
});

final storedUserProvider = FutureProvider<User?>((ref) async {
  try {
    final repo = await ref.watch(authRepositoryProvider.future);
    return await repo.getStoredUser();
  } catch (e) {
    return null;
  }
});

final isAuthenticatedProvider = FutureProvider<bool>((ref) async {
  final user = await ref.watch(storedUserProvider.future);
  return user != null;
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_banking_app/core/auth/repositories/shared_prefs_token_repository.dart';

final hasValidSessionProvider = FutureProvider<bool>((ref) async {
  final tokenRepository = SharedPrefsTokenRepository();
  return await tokenRepository.hasValidSession();
});

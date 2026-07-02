import 'package:mobile_banking_app/core/auth/models/auth_tokens.dart';

abstract class TokenRepository {
  Future<void> saveTokens(AuthTokens tokens);
  Future<AuthTokens?> getTokens();
  Future<void> deleteTokens();
  Future<bool> hasValidSession();
}

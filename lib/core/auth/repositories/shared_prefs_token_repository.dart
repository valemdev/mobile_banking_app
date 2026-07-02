import 'dart:convert';
import 'package:mobile_banking_app/core/auth/models/auth_tokens.dart';
import 'package:mobile_banking_app/core/auth/models/repositories/token_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_banking_app/core/constants.dart';
import 'package:mobile_banking_app/core/local_storage.dart';

class SharedPrefsTokenRepository implements TokenRepository {
  final SharedPreferences _prefs;

  SharedPrefsTokenRepository({SharedPreferences? sharedPreferences})
      : _prefs = sharedPreferences ?? LocalStorage().prefs;

  @override
  Future<void> saveTokens(AuthTokens tokens) async {
    final tokensJsonString = jsonEncode(tokens.toJson());
    await _prefs.setString(Constants.tokenLocalStorageKey, tokensJsonString);
  }

  @override
  Future<AuthTokens?> getTokens() async {
    final tokensJsonString = _prefs.getString(Constants.tokenLocalStorageKey);
    if (tokensJsonString == null) return null;

    try {
      final Map<String, dynamic> tokensMap =
          jsonDecode(tokensJsonString) as Map<String, dynamic>;
      return AuthTokens.fromJson(tokensMap);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> deleteTokens() async {
    await _prefs.remove(Constants.tokenLocalStorageKey);
    await _prefs.remove(Constants.userInformationLocalStorageKey);
  }

  @override
  Future<bool> hasValidSession() async {
    final tokens = await getTokens();
    return tokens != null;
  }
}

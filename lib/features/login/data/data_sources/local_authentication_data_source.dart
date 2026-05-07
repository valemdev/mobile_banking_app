import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:mobile_banking_app/features/login/data/models/user_model.dart';

abstract class LocalAuthenticationDataSource {
  Future<void> saveUser(UserModel user, String token);
  Future<UserModel?> getUser();
  Future<String?> getToken();
  Future<void> clearUser();
}

class LocalAuthenticationDataSourceImpl
    implements LocalAuthenticationDataSource {
  static const String _userKey = 'cached_user';
  static const String _tokenKey = 'auth_token';

  final SharedPreferences _prefs;

  LocalAuthenticationDataSourceImpl(this._prefs);

  @override
  Future<void> saveUser(UserModel user, String token) async {
    await _prefs.setString(_userKey, jsonEncode(user.toJson()));
    await _prefs.setString(_tokenKey, token);
  }

  @override
  Future<UserModel?> getUser() async {
    final String? userJson = _prefs.getString(_userKey);
    if (userJson == null) return null;
    try {
      return UserModel.fromJson(jsonDecode(userJson));
    } catch (e) {
      return null;
    }
  }

  @override
  Future<String?> getToken() async {
    return _prefs.getString(_tokenKey);
  }

  @override
  Future<void> clearUser() async {
    await _prefs.remove(_userKey);
    await _prefs.remove(_tokenKey);
  }
}

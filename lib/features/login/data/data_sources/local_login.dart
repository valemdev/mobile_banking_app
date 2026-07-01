import 'package:mobile_banking_app/core/constants.dart';
import 'package:mobile_banking_app/core/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalLoginDataSource {
  final SharedPreferences _prefs;

  LocalLoginDataSource({SharedPreferences? sharedPreferences})
    : _prefs = sharedPreferences ?? LocalStorage().prefs;

  Future<void> setToken(String value) async {
    await _prefs.setString(Constants.tokenLocalStorageKey, value);
  }

  Future<String?> getToken() async {
    return _prefs.getString(Constants.tokenLocalStorageKey);
  }

  Future<void> deleteToken() async {
    await _prefs.remove(Constants.tokenLocalStorageKey);
  }
}
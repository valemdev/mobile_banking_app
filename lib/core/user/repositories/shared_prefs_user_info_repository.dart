import 'dart:convert';

import 'package:mobile_banking_app/core/constants.dart';
import 'package:mobile_banking_app/core/local_storage.dart';
import 'package:mobile_banking_app/core/user/models/repositories/user_info.dart';
import 'package:mobile_banking_app/core/user/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsUserInfoRepository implements UserInfoRepository {
  final SharedPreferences _prefs;

  SharedPrefsUserInfoRepository({SharedPreferences? sharedPreferences})
      : _prefs = sharedPreferences ?? LocalStorage().prefs;
  @override
  Future<void> saveUserInfo(User user) async {
    final userJsonString = jsonEncode(user.toJson());
    await _prefs.setString(
        Constants.userInformationLocalStorageKey, userJsonString);
  }

  @override
  Future<User?> getUserInfo() async {
    final userJsonString =
        _prefs.getString(Constants.userInformationLocalStorageKey);
    if (userJsonString != null) {
      final userJson = jsonDecode(userJsonString) as Map<String, dynamic>;
      return User.fromJson(userJson);
    }
    return null;
  }

  @override
  Future<void> deleteUserInfo() async {
    await _prefs.remove(Constants.userInformationLocalStorageKey);
  }
}

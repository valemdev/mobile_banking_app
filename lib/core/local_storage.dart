import 'dart:convert';

import 'package:mobile_banking_app/core/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  late final SharedPreferences prefs;
  static final LocalStorage _instance = LocalStorage._internal();

  LocalStorage._internal();

  factory LocalStorage() {
    return _instance;
  }

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    const usersInformation = [
      {'user': 'Experience_1', 'name': 'Experience_1', 'image_url': 'https://picsum.photos/200/300'},
      {'user': 'Experience_2', 'name': 'Experience_2', 'image_url': 'https://picsum.photos/200/300'},
      {'user': 'Experience_3', 'name': 'Experience_3', 'image_url': 'https://picsum.photos/200/300'},
      {'user': 'Experience_4', 'name': 'Experience_4', 'image_url': 'https://picsum.photos/200/300'},
      {'user': 'Experience_5', 'name': 'Experience_5', 'image_url': 'https://picsum.photos/200/300'},
    ];
    await prefs.setString(
      Constants.userInformationLocalStorageKey,
      jsonEncode(usersInformation),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_banking_app/core/local_storage.dart';

const _localeKey = 'app_locale';

class LocaleNotifier extends Notifier<Locale> {
  @override
  Locale build() {
    // LocalStorage.init() is awaited before runApp(), so prefs is ready here.
    final saved = LocalStorage().prefs.getString(_localeKey);
    return saved != null ? Locale(saved) : const Locale('en');
  }

  Future<void> setLocale(Locale locale) async {
    state = locale; // synchronous — UI updates immediately
    await LocalStorage().prefs.setString(_localeKey, locale.languageCode);
  }
}

final localeProvider = NotifierProvider<LocaleNotifier, Locale>(
  LocaleNotifier.new,
);

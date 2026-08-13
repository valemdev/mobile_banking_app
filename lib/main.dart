import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_banking_app/app_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobile_banking_app/core/local_storage.dart';
import 'package:mobile_banking_app/core/auth/repositories/shared_prefs_token_repository.dart';
import 'package:mobile_banking_app/core/locale_provider.dart';
import 'package:mobile_banking_app/core/notifications_service.dart';
import 'l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

late bool _hasValidSession;

bool get hasValidSession => _hasValidSession;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage().init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationsService.instance.init();
  final tokenRepository = SharedPrefsTokenRepository();
  _hasValidSession = await tokenRepository.hasValidSession();

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      locale: locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
    );
  }
}

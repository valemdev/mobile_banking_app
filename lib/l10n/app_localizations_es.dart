// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get app_title => 'Mi Aplicación Bancaria';

  @override
  String get forgot_password => '¿Olvidaste tu contraseña?';

  @override
  String get signIn => 'Iniciar sesión';

  @override
  String get signUp => 'Crear cuenta';

  @override
  String get new_user => 'Nuevo usuario';

  @override
  String get email => 'Correo';

  @override
  String get email_address => 'Correo electronico';

  @override
  String get password => 'Contraseña';

  @override
  String get balance => 'Saldo disponible';

  @override
  String get transfer => 'Transferir';

  @override
  String get insufficient_funds => 'Fondos insuficientes';

  @override
  String get generic_error => 'Ocurrió un error. Inténtalo de nuevo.';
}

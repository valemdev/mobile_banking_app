import 'package:flutter/material.dart';
import 'package:mobile_banking_app/app_router.dart';
//import 'package:mobile_banking_app/features/login/presentation/views/login_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

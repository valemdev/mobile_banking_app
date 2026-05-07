import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mobile_banking_app/features/login/state/auth_provider.dart';

class AuthGuard {
  static Future<String?> checkAuth(
      BuildContext? context, GoRouterState state, WidgetRef ref) async {
    try {
      final isAuthenticated = await ref.watch(isAuthenticatedProvider.future);

      if (!isAuthenticated) {
        return '/';
      }

      return null;
    } catch (e) {
      return '/';
    }
  }
}

import 'package:go_router/go_router.dart';
import 'package:mobile_banking_app/features/configuration/presentation/views/configuration_view.dart';
import 'package:mobile_banking_app/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:mobile_banking_app/features/history/presentation/views/history_view.dart';
import 'package:mobile_banking_app/features/home/presentation/views/home_view.dart';
import 'package:mobile_banking_app/features/login/presentation/views/login_view.dart';
import 'package:mobile_banking_app/features/transfers/presentation/views/transfers_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginView(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardView(),
    ),
    GoRoute(
      path: '/transfers',
      builder: (context, state) => const TransfersView(),
    ),
    GoRoute(
      path: '/history',
      builder: (context, state) => const HistoryView(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsView(),
    )
  ],
);

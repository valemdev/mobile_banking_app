import 'package:go_router/go_router.dart';
import 'package:mobile_banking_app/features/configuration/presentation/views/configuration_view.dart';
import 'package:mobile_banking_app/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:mobile_banking_app/features/history/presentation/views/history_view.dart';
import 'package:mobile_banking_app/features/home/presentation/views/home_view.dart';
import 'package:mobile_banking_app/features/login/presentation/views/login_view.dart';
import 'package:mobile_banking_app/features/transfers/presentation/views/account_addition_view.dart';
import 'package:mobile_banking_app/features/transfers/presentation/views/account_selection_view.dart';
import 'package:mobile_banking_app/features/transfers/presentation/views/transfer_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginView(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          DashboardView(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/account_selection',
              builder: (context, state) => const AccountSelectionView(),
              routes: [
                GoRoute(
                  path: 'add_account',
                  builder: (context, state) => const AccountAdditionView(),
                ),
                GoRoute(
                  path: 'transfers',
                  builder: (context, state) => const TransferView(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/history',
              builder: (context, state) => const HistoryView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              builder: (context, state) => const SettingsView(),
            ),
          ],
        ),
      ],
    ),
  ],
);

import 'package:go_router/go_router.dart';
import 'package:mobile_banking_app/features/login/presentation/views/login_riverpod_view.dart';
import 'package:mobile_banking_app/features/settings/domain/models/profile_card_model.dart';
import 'package:mobile_banking_app/features/settings/presentation/views/change_password_view.dart';
import 'package:mobile_banking_app/features/settings/presentation/views/contact_us_view.dart';
import 'package:mobile_banking_app/features/settings/presentation/views/personal_information_view.dart';
import 'package:mobile_banking_app/features/settings/presentation/views/profile_view.dart';
import 'package:mobile_banking_app/features/settings/presentation/views/settings_view.dart';
import 'package:mobile_banking_app/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:mobile_banking_app/features/history/presentation/views/history_view.dart';
import 'package:mobile_banking_app/features/home/presentation/views/home_view.dart';
import 'package:mobile_banking_app/features/transfers/presentation/views/account_addition_view.dart';
import 'package:mobile_banking_app/features/transfers/presentation/views/account_selection_view.dart';
import 'package:mobile_banking_app/features/transfers/presentation/views/transfer_view.dart';

const profileCard = ProfileCard(
  name: "Jane Smith",
  profession: "Software Engineer",
  imageUrl:
      "https://media.istockphoto.com/id/1494508936/es/foto/feliz-emocionado-y-llame-por-tel%C3%A9fono-con-una-mujer-negra-en-el-estudio-para-mensajes-de-texto.jpg?s=2048x2048&w=is&k=20&c=OEIskWFgyI7MNN67gh6zr4227gK9A54C90JNyxCN-Kg=",
  email: "janesmith@gmail.com",
  phone: "+000 00 00 000",
  birthDay: 28,
  birthMonth: "September",
  birthYear: 2000,
  joinedDate: "28 Jan 2021",
);

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginRiverpodView(),
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
              routes: [
                GoRoute(
                  path: 'profile',
                  builder: (context, state) => const ProfileView(),
                  routes: [
                    GoRoute(
                      path: 'personal_information',
                      builder: (context, state) =>
                          const PersonalInformationView(profile: profileCard),
                    ),
                  ],
                ),
                GoRoute(
                  path: 'contact_us',
                  builder: (context, state) => const ContactUsView(),
                ),
                GoRoute(
                  path: 'change_password',
                  builder: (context, state) => const ChangePasswordView(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

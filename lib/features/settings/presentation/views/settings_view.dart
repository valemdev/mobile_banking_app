import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_banking_app/app_colors.dart';
import 'package:mobile_banking_app/features/login/state/login_notifier.dart';
import 'package:mobile_banking_app/widgets/back_button.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.screenSoft,
      body: SafeArea(
        child: Column(
          children: [
            /// HEADER
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackButtonWidget(route: '/home'),
                    IconButton(
                      icon: const Icon(Icons.logout),
                      onPressed: () async {
                        final loginNotifier = ref.read(loginProvider.notifier);
                        await loginNotifier.logout();
                        if (context.mounted) {
                          context.go('/');
                        }
                      },
                    ),
                  ],
                ),
                const Text(
                  "Configuración",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "General",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surfacePrimary,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.strokeSoft),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text("Mi perfil"),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        context.go('/settings/profile');
                      },
                    ),
                    const Divider(height: 1),
                    ListTile(
                      title: const Text("Contáctanos"),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        context.go('/settings/contact_us');
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Seguridad",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surfacePrimary,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.strokeSoft),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text("Cambiar contraseña"),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        context.go('/settings/change_password');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

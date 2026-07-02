import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_banking_app/app_colors.dart';
import 'package:mobile_banking_app/core/locale_provider.dart';
import 'package:mobile_banking_app/widgets/back_button.dart';

class LanguageView extends ConsumerWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(localeProvider);

    return Scaffold(
      backgroundColor: AppColors.screenSoft,
      body: SafeArea(
        child: Column(
          children: [
            /// HEADER
            const Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  children: [
                    BackButtonWidget(route: '/settings'),
                  ],
                ),
                Text(
                  "Idioma",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Selecciona un idioma",
                  style: TextStyle(
                    fontSize: 16,
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
                    _LanguageTile(
                      flag: '🇺🇸',
                      language: 'English',
                      locale: const Locale('en'),
                      isSelected: currentLocale.languageCode == 'en',
                      onTap: () => ref
                          .read(localeProvider.notifier)
                          .setLocale(const Locale('en')),
                    ),
                    const Divider(height: 1),
                    _LanguageTile(
                      flag: '🇪🇸',
                      language: 'Español',
                      locale: const Locale('es'),
                      isSelected: currentLocale.languageCode == 'es',
                      onTap: () => ref
                          .read(localeProvider.notifier)
                          .setLocale(const Locale('es')),
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

class _LanguageTile extends StatelessWidget {
  const _LanguageTile({
    required this.flag,
    required this.language,
    required this.locale,
    required this.isSelected,
    required this.onTap,
  });

  final String flag;
  final String language;
  final Locale locale;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Text(
        flag,
        style: const TextStyle(fontSize: 28),
      ),
      title: Text(
        language,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          color: isSelected ? AppColors.primaryColor : AppColors.textPrimary,
        ),
      ),
      trailing: isSelected
          ? const Icon(Icons.check_circle, color: AppColors.primaryColor)
          : const Icon(Icons.radio_button_unchecked,
              color: AppColors.strokeSoft),
    );
  }
}

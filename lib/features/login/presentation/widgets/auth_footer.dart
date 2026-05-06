import 'package:flutter/material.dart';
import 'package:mobile_banking_app/app_colors.dart';
import 'package:mobile_banking_app/l10n/app_localizations.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${AppLocalizations.of(context)!.new_user}. ',
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.loginTextColor,
            ),
          ),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ir a registro')),
              );
            },
            child: Text(
              AppLocalizations.of(context)!.signUp,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

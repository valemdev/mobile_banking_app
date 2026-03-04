import 'package:flutter/material.dart';
import 'package:mobile_banking_app/app_colors.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "I'm a new user. ",
            style: TextStyle(
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
            child: const Text(
              'Sign Up',
              style: TextStyle(
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

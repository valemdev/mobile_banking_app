import 'package:flutter/material.dart';
import 'package:mobile_banking_app/app_colors.dart';
import 'package:mobile_banking_app/l10n/app_localizations.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const EmailField({super.key, required this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator, // 🔹 Form validator
      style: const TextStyle(fontSize: 15),
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(Icons.email_outlined,
              size: 22, color: AppColors.loginTextColor),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        hintText: AppLocalizations.of(context)!.email,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.loginTextColor, width: 1.5),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
        ),
      ),
    );
  }
}

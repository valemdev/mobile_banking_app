import 'package:flutter/material.dart';
import 'package:mobile_banking_app/app_colors.dart';

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
      decoration: const InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(Icons.email_outlined,
              size: 22, color: AppColors.loginTextColor),
        ),
        prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
        hintText: 'Email',
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.loginTextColor, width: 1.5),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
        ),
      ),
    );
  }
}

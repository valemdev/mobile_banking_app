import 'package:flutter/material.dart';
import 'package:mobile_banking_app/app_colors.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 200),
            const Text(
              'Sign In',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 30),
            const Text(
              'Email Address',
              style: TextStyle(fontSize: 14, color: AppColors.loginTextColor),
            ),
            const SizedBox(height: 5),
            const TextField(
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.email_outlined,
                    size: 22,
                    color: AppColors.loginTextColor,
                  ),
                ),
                prefixIconConstraints: BoxConstraints(
                  minWidth: 0,
                  minHeight: 0,
                ),
                hintText: 'Email',

                // 🔹 Borde cuando NO está enfocado
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.loginTextColor,
                    width: 1.5,
                  ),
                ),

                // 🔹 Borde cuando está enfocado
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Password',
              style: TextStyle(fontSize: 14, color: AppColors.loginTextColor),
            ),
            TextField(
              style: const TextStyle(fontSize: 15),
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.lock_outline,
                    size: 22,
                    color: AppColors.loginTextColor,
                  ),
                ),
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 0,
                  minHeight: 0,
                ),
                hintText: 'Password',

                // 👁️ Ojito
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.loginTextColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),

                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.loginTextColor,
                    width: 1.5,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'Sign In',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 18),
            Center(
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
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_banking_app/features/login/presentation/widgets/auth_footer.dart';
import 'package:mobile_banking_app/features/login/presentation/widgets/email_field_widget.dart';
import 'package:mobile_banking_app/features/login/presentation/widgets/password_field_widget.dart';
import 'package:mobile_banking_app/features/login/presentation/widgets/primary_button.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 200),
              const Text(
                'Sign In',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 30),
              const Text('Email Address'),
              const SizedBox(height: 5),
              EmailField(
                controller: emailController,
                validator: (value) {
                  /*  if (value == null || value.isEmpty) {
                    return 'Ingrese su email';
                  }
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Email inválido';
                  } */
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text('Password'),
              const SizedBox(height: 5),
              PasswordField(
                controller: passwordController,
                validator: (value) {
                  /* if (value == null || value.isEmpty) {
                    return 'Ingrese su contraseña';
                  }
                  if (value.length < 6) {
                    return 'Mínimo 6 caracteres';
                  } */
                  return null;
                },
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                text: 'Sign In',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    String email = emailController.text;
                    String password = passwordController.text;

                    print('Email: $email, Password: $password');

                    context.go('/home');
                  }
                },
              ),
              const SizedBox(height: 18),
              const AuthFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

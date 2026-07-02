import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_banking_app/features/login/presentation/state/login_notifier.dart';
import 'package:mobile_banking_app/features/login/presentation/state/login_state.dart';
import 'package:mobile_banking_app/features/login/presentation/widgets/auth_footer.dart';
import 'package:mobile_banking_app/features/login/presentation/widgets/email_field_widget.dart';
import 'package:mobile_banking_app/features/login/presentation/widgets/password_field_widget.dart';
import 'package:mobile_banking_app/features/login/presentation/widgets/primary_button.dart';
import 'package:mobile_banking_app/l10n/app_localizations.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return _LoginView();
  }
}

class _LoginView extends ConsumerWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 200),
              Text(
                AppLocalizations.of(context)!.signIn,
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 30),
              Text(AppLocalizations.of(context)!.email_address),
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
              Text(AppLocalizations.of(context)!.password),
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
                text: AppLocalizations.of(context)!.signIn,
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    String email = emailController.text;
                    String password = passwordController.text;

                    await ref
                        .read(loginNotifierProvider.notifier)
                        .login(email, password);
                    if (!context.mounted) return;
                    final loginState = ref.read(loginNotifierProvider);
                    if (loginState is LoginSuccessState) {
                      context.go('/home');
                    } else if (loginState is LoginErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'Error de inicio de sesión: ${loginState.errorMessage}')),
                      );
                    }
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

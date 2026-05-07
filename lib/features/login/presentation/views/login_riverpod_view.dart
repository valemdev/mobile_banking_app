import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_banking_app/features/login/presentation/widgets/auth_footer.dart';
import 'package:mobile_banking_app/features/login/presentation/widgets/email_field_widget.dart';
import 'package:mobile_banking_app/features/login/presentation/widgets/password_field_widget.dart';
import 'package:mobile_banking_app/features/login/presentation/widgets/primary_button.dart';
import 'package:mobile_banking_app/features/login/state/login_notifier.dart';
import 'package:mobile_banking_app/l10n/app_localizations.dart';

class LoginRiverpodView extends ConsumerWidget {
  LoginRiverpodView({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(loginProvider).title;
    final loginState = ref.watch(loginProvider).logged;
    final loginNotifier = ref.read(loginProvider.notifier);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (loginState) {
        // Navegar a otra pantalla
        context.go('/home');
      }
    });
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
                title,
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 30),
              Text(AppLocalizations.of(context)!.email_address),
              const SizedBox(height: 5),
              EmailField(
                controller: emailController,
                validator: (value) {
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Text(AppLocalizations.of(context)!.password),
              const SizedBox(height: 5),
              PasswordField(
                controller: passwordController,
                validator: (value) {
                  return null;
                },
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                text: AppLocalizations.of(context)!.signIn,
                onPressed: () async {
                  loginNotifier.login(
                      emailController.text, passwordController.text);
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

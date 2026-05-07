import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_banking_app/features/login/presentation/widgets/auth_footer.dart';
import 'package:mobile_banking_app/features/login/presentation/widgets/email_field_widget.dart';
import 'package:mobile_banking_app/features/login/presentation/widgets/password_field_widget.dart';
import 'package:mobile_banking_app/features/login/presentation/widgets/primary_button.dart';
import 'package:mobile_banking_app/features/login/state/login_notifier_provider.dart';
import 'package:mobile_banking_app/features/login/state/login_state.dart';
import 'package:mobile_banking_app/l10n/app_localizations.dart';

class LoginRiverpodView extends ConsumerWidget {
  LoginRiverpodView({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginNotifierProvider);
    final loginNotifier = ref.read(loginNotifierProvider.notifier);

    ref.listen<LoginState>(loginNotifierProvider, (previous, next) {
      if (next.logged) {
        context.go('/home');
      }
    });

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  Text(
                    AppLocalizations.of(context)!.signIn,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Email Field
                  Text(AppLocalizations.of(context)!.email_address),
                  const SizedBox(height: 5),
                  EmailField(
                    controller: emailController,
                    validator: (value) => ValidationHelper.validateEmail(value),
                  ),
                  const SizedBox(height: 20),
                  // Password Field
                  Text(AppLocalizations.of(context)!.password),
                  const SizedBox(height: 5),
                  PasswordField(
                    controller: passwordController,
                    validator: (value) =>
                        ValidationHelper.validatePassword(value),
                  ),
                  const SizedBox(height: 20),
                  // Error message display
                  loginState.maybeWhen(
                    error: (errorMessage) => Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.red.shade300),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.error_outline,
                              color: Colors.red, size: 20),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              errorMessage,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    orElse: () => const SizedBox.shrink(),
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(
                    text: AppLocalizations.of(context)!.signIn,
                    isLoading: loginState.isLoading,
                    onPressed: loginState.isLoading
                        ? null
                        : () async {
                            await loginNotifier.login(
                              emailController.text,
                              passwordController.text,
                            );
                          },
                  ),
                  const SizedBox(height: 18),
                  const AuthFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

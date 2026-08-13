import 'package:flutter/material.dart';
import 'package:mobile_banking_app/app_colors.dart';
import 'package:mobile_banking_app/features/home/domain/entities/user_entity.dart';
import 'package:mobile_banking_app/l10n/app_localizations.dart';

class Welcome extends StatelessWidget {
  final UserEntity user;

  const Welcome({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(user.imageUrl),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.welcome,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textMuted,
              ),
            ),
            Text(
              user.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}

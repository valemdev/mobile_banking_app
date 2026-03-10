import 'package:flutter/material.dart';
import 'package:mobile_banking_app/app_colors.dart';
import 'package:mobile_banking_app/features/history/domain/models/history_product_model.dart';

class HistoryMovementsList extends StatelessWidget {
  final List<HistoryMovement> movements;

  const HistoryMovementsList({
    super.key,
    required this.movements,
  });

  @override
  Widget build(BuildContext context) {
    if (movements.isEmpty) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.surfacePrimary,
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Text(
          'No hay movimientos para este producto.',
          textAlign: TextAlign.center,
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: movements.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final movement = movements[index];
        final isIncome = movement.amount >= 0;

        return Container(
          decoration: BoxDecoration(
            color: AppColors.surfacePrimary,
            borderRadius: BorderRadius.circular(14),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: isIncome
                  ? AppColors.statusPositive
                  : AppColors.statusNegative,
              child: Icon(
                isIncome ? Icons.arrow_downward : Icons.arrow_upward,
                color: AppColors.surfacePrimary,
              ),
            ),
            title: Text(
              movement.description,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text('${movement.category} • ${movement.date}'),
            trailing: Text(
              '${isIncome ? '+' : '-'}Q ${movement.amount.abs().toStringAsFixed(2)}',
              style: TextStyle(
                color: isIncome
                    ? AppColors.statusPositive
                    : AppColors.statusNegative,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        );
      },
    );
  }
}

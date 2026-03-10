import 'package:flutter/material.dart';
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
          color: Colors.white,
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor:
                  isIncome ? Colors.green.shade50 : Colors.red.shade50,
              child: Icon(
                isIncome ? Icons.arrow_downward : Icons.arrow_upward,
                color: isIncome ? Colors.green : Colors.red,
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
                color: isIncome ? Colors.green : Colors.red,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        );
      },
    );
  }
}

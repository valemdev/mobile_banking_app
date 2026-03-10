import 'package:flutter/material.dart';
import 'package:mobile_banking_app/app_colors.dart';
import 'package:mobile_banking_app/features/home/domain/models/las_transaction_model.dart';

class LastTransactions extends StatelessWidget {
  final List<TransactionModel> transactions;

  const LastTransactions({
    super.key,
    required this.transactions,
  });

  String _formatDate(DateTime date) {
    final difference = DateTime.now().difference(date);

    if (difference.inMinutes < 60) {
      return "Hace ${difference.inMinutes} min";
    } else if (difference.inHours < 24) {
      return "Hace ${difference.inHours} horas";
    } else {
      return "Hace ${difference.inDays} días";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Transacciones",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Material(
              child: InkWell(
                onTap: () {
                  print("Ver todo");
                },
                child: const SizedBox(
                  width: 56,
                  height: 30,
                  child: Center(
                    child: Text(
                      'Ver todo',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final tx = transactions[index];
            final isIncome = tx.amount > 0;

            return ListTile(
              leading: CircleAvatar(
                backgroundColor: isIncome
                    ? AppColors.statusPositive
                    : AppColors.statusNegative,
                child: Icon(
                  isIncome ? Icons.arrow_downward : Icons.arrow_upward,
                  color: AppColors.surfacePrimary,
                ),
              ),
              title: Text(tx.title),
              subtitle: Text(_formatDate(tx.date)),
              trailing: Text(
                "\$${tx.amount.toStringAsFixed(2)}",
                style: TextStyle(
                  color: isIncome
                      ? AppColors.statusPositive
                      : AppColors.statusNegative,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

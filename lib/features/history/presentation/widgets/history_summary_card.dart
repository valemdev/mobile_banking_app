import 'package:flutter/material.dart';
import 'package:mobile_banking_app/app_colors.dart';
import 'package:mobile_banking_app/features/history/domain/models/history_product_model.dart';

class HistorySummaryCard extends StatelessWidget {
  final HistoryProduct product;

  const HistorySummaryCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${product.typeLabel} ${product.name} ${product.maskedIdentifier}',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 14),
          ...product.summaryItems.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _SummaryRow(item: item),
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final HistorySummaryItem item;

  const _SummaryRow({required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          item.label,
          style: TextStyle(
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          item.value,
          style: TextStyle(
            color: item.highlight ? AppColors.primaryColor : Colors.black87,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

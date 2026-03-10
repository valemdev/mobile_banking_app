import 'package:flutter/material.dart';
import 'package:mobile_banking_app/app_colors.dart';
import 'package:mobile_banking_app/features/history/domain/models/history_product_model.dart';

class HistoryProductSelector extends StatelessWidget {
  final List<HistoryProduct> products;
  final String selectedProductId;
  final ValueChanged<String?> onChanged;

  const HistoryProductSelector({
    super.key,
    required this.products,
    required this.selectedProductId,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.surfacePrimary,
        borderRadius: BorderRadius.circular(14),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedProductId,
          isExpanded: true,
          items: products
              .map(
                (product) => DropdownMenuItem<String>(
                  value: product.id,
                  child: Text(
                    '${product.typeLabel}: ${product.name} ${product.maskedIdentifier}',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

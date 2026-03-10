import 'package:flutter/material.dart';
import 'package:mobile_banking_app/app_colors.dart';
import 'package:mobile_banking_app/features/history/data/history_mock_data.dart';
import 'package:mobile_banking_app/features/history/domain/models/history_product_model.dart';
import 'package:mobile_banking_app/features/history/presentation/widgets/history_header.dart';
import 'package:mobile_banking_app/features/history/presentation/widgets/history_movements_list.dart';
import 'package:mobile_banking_app/features/history/presentation/widgets/history_product_selector.dart';
import 'package:mobile_banking_app/features/history/presentation/widgets/history_summary_card.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  final List<HistoryProduct> _products = HistoryMockData.products;
  String? _selectedProductId;

  @override
  void initState() {
    super.initState();
    if (_products.isNotEmpty) {
      _selectedProductId = _products.first.id;
    }
  }

  HistoryProduct? get _selectedProduct {
    if (_products.isEmpty) {
      return null;
    }

    final selectedId = _selectedProductId;
    if (selectedId == null) {
      return _products.first;
    }

    for (final product in _products) {
      if (product.id == selectedId) {
        return product;
      }
    }

    return _products.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HistoryHeader(),
              const SizedBox(height: 18),
              if (_selectedProduct != null) ...[
                HistoryProductSelector(
                  products: _products,
                  selectedProductId: _selectedProduct!.id,
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }

                    setState(() {
                      _selectedProductId = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                HistorySummaryCard(product: _selectedProduct!),
                const SizedBox(height: 16),
                const Text(
                  'Movimientos recientes',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                HistoryMovementsList(movements: _selectedProduct!.movements),
              ] else ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Text(
                    'No hay productos para mostrar historial.',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

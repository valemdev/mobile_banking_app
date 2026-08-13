import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_banking_app/app_colors.dart';
import 'package:mobile_banking_app/features/history/data/history_mock_data.dart';
import 'package:mobile_banking_app/features/history/domain/models/history_product_model.dart';
import 'package:mobile_banking_app/features/history/presentation/widgets/history_header.dart';
import 'package:mobile_banking_app/features/history/presentation/widgets/history_movements_list.dart';
import 'package:mobile_banking_app/features/history/presentation/widgets/history_product_selector.dart';
import 'package:mobile_banking_app/features/history/presentation/widgets/history_summary_card.dart';
import 'package:mobile_banking_app/features/history/presentation/state/history_notifier.dart';
import 'package:mobile_banking_app/features/history/presentation/state/history_state.dart';

class HistoryView extends ConsumerStatefulWidget {
  const HistoryView({super.key});

  @override
  ConsumerState<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends ConsumerState<HistoryView> {
  final List<HistoryProduct> _products = HistoryMockData.products;
  String? _selectedProductId;

  @override
  void initState() {
    super.initState();
    if (_products.isNotEmpty) {
      _selectedProductId = _products.first.id;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(historyNotifierProvider.notifier).loadInitial();
    });
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
    final historyState = ref.watch(historyNotifierProvider);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => ref.read(historyNotifierProvider.notifier).refresh(),
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.axis == Axis.vertical &&
                  notification.metrics.maxScrollExtent > 0 &&
                  notification.metrics.pixels >=
                      notification.metrics.maxScrollExtent - 300) {
                ref.read(historyNotifierProvider.notifier).loadNextPage();
              }
              return false;
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
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
                    if (historyState.status == HistoryStatus.loading)
                      const Center(child: CircularProgressIndicator())
                    else if (historyState.status == HistoryStatus.error)
                      _HistoryError(
                        message: historyState.errorMessage,
                        onRetry: () => ref
                            .read(historyNotifierProvider.notifier)
                            .refresh(),
                      )
                    else ...[
                      HistoryMovementsList(movements: historyState.movements),
                      if (historyState.status == HistoryStatus.loadingMore)
                        const Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(child: CircularProgressIndicator()),
                        ),
                      if (!historyState.hasMore &&
                          historyState.movements.isNotEmpty)
                        const Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(child: Text('No hay más movimientos.')),
                        ),
                      if (historyState.errorMessage != null &&
                          historyState.status != HistoryStatus.loadingMore)
                        _HistoryError(
                          message: historyState.errorMessage,
                          onRetry: () => ref
                              .read(historyNotifierProvider.notifier)
                              .loadNextPage(),
                        ),
                    ],
                  ] else ...[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.surfacePrimary,
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
        ),
      ),
    );
  }
}

class _HistoryError extends StatelessWidget {
  final String? message;
  final VoidCallback onRetry;

  const _HistoryError({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Text(message ?? 'No se pudo cargar el historial.'),
          TextButton(onPressed: onRetry, child: const Text('Reintentar')),
        ],
      ),
    );
  }
}

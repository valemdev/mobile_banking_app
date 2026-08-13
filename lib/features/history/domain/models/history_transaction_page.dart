import 'history_product_model.dart';

class HistoryTransactionPage {
  final List<HistoryMovement> movements;
  final Object? cursor;
  final bool hasMore;

  const HistoryTransactionPage({
    required this.movements,
    required this.cursor,
    required this.hasMore,
  });
}

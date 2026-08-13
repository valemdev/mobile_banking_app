import 'package:mobile_banking_app/features/history/domain/models/history_product_model.dart';

enum HistoryStatus { initial, loading, success, loadingMore, error }

class HistoryState {
  final HistoryStatus status;
  final List<HistoryMovement> movements;
  final Object? cursor;
  final bool hasMore;
  final String? errorMessage;

  const HistoryState({
    required this.status,
    this.movements = const [],
    this.cursor,
    this.hasMore = true,
    this.errorMessage,
  });

  HistoryState copyWith({
    HistoryStatus? status,
    List<HistoryMovement>? movements,
    Object? cursor,
    bool? hasMore,
    String? errorMessage,
  }) {
    return HistoryState(
      status: status ?? this.status,
      movements: movements ?? this.movements,
      cursor: cursor ?? this.cursor,
      hasMore: hasMore ?? this.hasMore,
      errorMessage: errorMessage,
    );
  }
}

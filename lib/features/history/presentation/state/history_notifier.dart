import 'package:mobile_banking_app/features/history/domain/models/history_transaction_page.dart';
import 'package:mobile_banking_app/features/history/domain/models/history_product_model.dart';
import 'package:mobile_banking_app/features/history/domain/use_cases/get_transactions.dart';
import 'package:mobile_banking_app/features/history/presentation/state/history_state.dart';
import 'package:riverpod/legacy.dart';

final historyNotifierProvider =
    StateNotifierProvider<HistoryNotifier, HistoryState>(
  (ref) => HistoryNotifier(),
);

class HistoryNotifier extends StateNotifier<HistoryState> {
  final GetTransactionsUseCase _getTransactionsUseCase;
  bool _isRequestInProgress = false;

  HistoryNotifier({GetTransactionsUseCase? getTransactionsUseCase})
      : _getTransactionsUseCase =
            getTransactionsUseCase ?? GetTransactionsUseCase(),
        super(const HistoryState(status: HistoryStatus.initial));

  Future<void> loadInitial() async {
    if (_isRequestInProgress || state.status == HistoryStatus.success) {
      return;
    }

    _isRequestInProgress = true;
    state = const HistoryState(status: HistoryStatus.loading);
    try {
      final page = await _getTransactionsUseCase();
      state = _stateFromPage(page, HistoryStatus.success);
    } catch (e) {
      state = HistoryState(
        status: HistoryStatus.error,
        errorMessage: e.toString(),
      );
    } finally {
      _isRequestInProgress = false;
    }
  }

  Future<void> loadNextPage() async {
    if (_isRequestInProgress || !state.hasMore) {
      return;
    }

    _isRequestInProgress = true;
    state = state.copyWith(status: HistoryStatus.loadingMore);
    try {
      final page = await _getTransactionsUseCase(cursor: state.cursor);
      state = _stateFromPage(
        page,
        HistoryStatus.success,
        movements: [...state.movements, ...page.movements],
      );
    } catch (e) {
      state = state.copyWith(
        status: HistoryStatus.success,
        errorMessage: e.toString(),
      );
    } finally {
      _isRequestInProgress = false;
    }
  }

  Future<void> refresh() async {
    if (_isRequestInProgress) {
      return;
    }

    state = const HistoryState(status: HistoryStatus.initial);
    await loadInitial();
  }

  HistoryState _stateFromPage(
    HistoryTransactionPage page,
    HistoryStatus status, {
    List<HistoryMovement>? movements,
  }) {
    return HistoryState(
      status: status,
      movements: movements ?? page.movements,
      cursor: page.cursor,
      hasMore: page.hasMore,
    );
  }
}

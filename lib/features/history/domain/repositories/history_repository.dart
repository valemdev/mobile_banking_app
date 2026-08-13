import 'package:mobile_banking_app/features/history/domain/models/history_transaction_page.dart';

abstract class HistoryRepository {
  Future<HistoryTransactionPage> getTransactions({Object? cursor});
}

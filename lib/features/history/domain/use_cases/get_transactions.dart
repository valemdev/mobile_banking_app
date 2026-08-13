import 'package:mobile_banking_app/features/history/data/repositories/history_repository.dart';
import 'package:mobile_banking_app/features/history/domain/models/history_transaction_page.dart';
import 'package:mobile_banking_app/features/history/domain/repositories/history_repository.dart';

class GetTransactionsUseCase {
  final HistoryRepository _repository;

  GetTransactionsUseCase({HistoryRepository? repository})
      : _repository = repository ?? HistoryRepositoryImpl();

  Future<HistoryTransactionPage> call({Object? cursor}) {
    return _repository.getTransactions(cursor: cursor);
  }
}

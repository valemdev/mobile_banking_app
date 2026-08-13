import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_banking_app/features/history/data/data_sources/history_data_source.dart';
import 'package:mobile_banking_app/features/history/domain/models/history_transaction_page.dart';
import 'package:mobile_banking_app/features/history/domain/repositories/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryDataSource _dataSource;

  HistoryRepositoryImpl({HistoryDataSource? dataSource})
      : _dataSource = dataSource ?? HistoryDataSource();

  @override
  Future<HistoryTransactionPage> getTransactions({Object? cursor}) {
    return _dataSource.getTransactions(
      cursor: cursor as DocumentSnapshot<Map<String, dynamic>>?,
    );
  }
}

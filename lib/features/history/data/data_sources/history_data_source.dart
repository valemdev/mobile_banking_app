import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:mobile_banking_app/features/history/domain/models/history_product_model.dart';
import 'package:mobile_banking_app/features/history/domain/models/history_transaction_page.dart';

class HistoryDataSource {
  static const pageSize = 15;

  final FirebaseFirestore _firestore;

  HistoryDataSource({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<HistoryTransactionPage> getTransactions({
    DocumentSnapshot<Map<String, dynamic>>? cursor,
  }) async {
    try {
      Query<Map<String, dynamic>> query = _firestore
          .collection('transactions')
          .orderBy('createdAt', descending: true)
          .limit(pageSize);

      if (cursor != null) {
        query = query.startAfterDocument(cursor);
      }

      final snapshot = await query.get();
      final movements = snapshot.docs.map(_toMovement).toList();

      return HistoryTransactionPage(
        movements: movements,
        cursor: snapshot.docs.isEmpty ? cursor : snapshot.docs.last,
        hasMore: snapshot.docs.length == pageSize,
      );
    } catch (e) {
      throw Exception('Failed to load transaction history: $e');
    }
  }

  HistoryMovement _toMovement(
    QueryDocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data();
    final amount = (data['amount'] as num?)?.toDouble() ?? 0;
    final createdAt = data['createdAt'];

    return HistoryMovement(
      description:
          (data['description'] ?? data['title'] ?? 'Movimiento').toString(),
      category: (data['category'] ?? data['type'] ?? 'General').toString(),
      date: _formatDate(createdAt),
      amount: amount,
    );
  }

  String _formatDate(Object? value) {
    final date = switch (value) {
      Timestamp timestamp => timestamp.toDate(),
      DateTime dateTime => dateTime,
      String text => DateTime.tryParse(text),
      _ => null,
    };

    return date == null
        ? 'Fecha no disponible'
        : DateFormat('dd MMM yyyy', 'es').format(date);
  }
}

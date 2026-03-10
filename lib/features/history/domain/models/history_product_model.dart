enum HistoryProductType {
  creditCard,
  checkingAccount,
  savingsAccount,
}

class HistorySummaryItem {
  final String label;
  final String value;
  final bool highlight;

  const HistorySummaryItem({
    required this.label,
    required this.value,
    this.highlight = false,
  });
}

class HistoryMovement {
  final String description;
  final String category;
  final String date;
  final double amount;

  const HistoryMovement({
    required this.description,
    required this.category,
    required this.date,
    required this.amount,
  });
}

class HistoryProduct {
  final String id;
  final String name;
  final String maskedIdentifier;
  final HistoryProductType type;
  final List<HistorySummaryItem> summaryItems;
  final List<HistoryMovement> movements;

  const HistoryProduct({
    required this.id,
    required this.name,
    required this.maskedIdentifier,
    required this.type,
    required this.summaryItems,
    required this.movements,
  });

  String get typeLabel {
    switch (type) {
      case HistoryProductType.creditCard:
        return 'Tarjeta de credito';
      case HistoryProductType.checkingAccount:
        return 'Cuenta monetaria';
      case HistoryProductType.savingsAccount:
        return 'Cuenta de ahorro';
    }
  }
}

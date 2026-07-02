class TransactionModel {
  final String title;
  final DateTime date;
  final double amount;

  TransactionModel({
    required this.title,
    required this.date,
    required this.amount,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      title: json['title'],
      date: DateTime.parse(json['date']),
      amount: json['amount'].toDouble(),
    );
  }
}

class Account {
  final String name;
  final String type;
  final String number;
  final String currency;
  final String status;
  final double balance;

  Account({
    required this.name,
    required this.type,
    required this.number,
    required this.currency,
    required this.status,
    required this.balance,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      name: json["name"],
      type: json["type"],
      number: json["number"],
      currency: json["currency"],
      status: json["status"],
      balance: json["balance"].toDouble(),
    );
  }
}

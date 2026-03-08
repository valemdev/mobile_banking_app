class PhysicalCard {
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final String cvv;

  PhysicalCard({
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cvv,
  });

  factory PhysicalCard.fromJson(Map<String, dynamic> json) {
    return PhysicalCard(
      cardNumber: json["cardNumber"],
      cardHolderName: json["cardHolderName"],
      expiryDate: json["expiryDate"],
      cvv: json["cvv"],
    );
  }
}

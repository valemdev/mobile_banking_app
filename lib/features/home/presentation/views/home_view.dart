import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_banking_app/features/home/domain/models/account_model.dart';
import 'package:mobile_banking_app/features/home/domain/models/plastic_card_model.dart';
import 'package:mobile_banking_app/features/home/presentation/widgets/account_carousel.dart';
import 'package:mobile_banking_app/features/home/presentation/widgets/action_button.dart';
import 'package:mobile_banking_app/features/home/presentation/widgets/plastic_card.dart';

final PhysicalCard card = PhysicalCard(
  cardNumber: "4876 5432 1098 7654",
  cardHolderName: "Jane Smith",
  expiryDate: "11/23",
  cvv: "456",
);

final List<Account> accounts = [
  Account(
    name: "Account 1",
    type: "Checking",
    number: "123456789",
    currency: "USD",
    status: "Active",
    balance: 1000.0,
  ),
  Account(
    name: "Account 2",
    type: "Savings",
    number: "987654321",
    currency: "USD",
    status: "Active",
    balance: 2000.0,
  ),
  Account(
    name: "Account 3",
    type: "Checking",
    number: "112233445",
    currency: "USD",
    status: "Active",
    balance: 3000.0,
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: PlasticCard(card: card),
              ),
              const SizedBox(height: 24),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ActionButton(
                        icon: Icons.arrow_upward,
                        label: "Enviar",
                        onTap: () {
                          context.go('/transfers');
                        }),
                    ActionButton(
                        icon: Icons.arrow_downward,
                        label: "Recibir",
                        onTap: () {
                          context.go('/history');
                        }),
                    ActionButton(
                        icon: Icons.attach_money,
                        label: "Movimientos",
                        onTap: () {
                          context.go('/dashboard');
                        })
                  ],
                ),
              ),
              const SizedBox(height: 24),
              AccountCarousel(accounts: accounts),
            ],
          ),
        ),
      ),
    );
  }
}

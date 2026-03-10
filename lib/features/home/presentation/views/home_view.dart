import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_banking_app/features/home/domain/models/account_model.dart';
import 'package:mobile_banking_app/features/home/domain/models/las_transaction_model.dart';
import 'package:mobile_banking_app/features/home/domain/models/plastic_card_model.dart';
import 'package:mobile_banking_app/features/home/domain/models/user_model.dart';
import 'package:mobile_banking_app/features/home/presentation/widgets/account_carousel.dart';
import 'package:mobile_banking_app/features/home/presentation/widgets/action_button.dart';
import 'package:mobile_banking_app/features/home/presentation/widgets/last_transactions.dart';
import 'package:mobile_banking_app/features/home/presentation/widgets/plastic_card.dart';
import 'package:mobile_banking_app/features/home/presentation/widgets/welcome.dart';

final user = User(
  name: "Jane Smith",
  imageUrl:
      "https://media.istockphoto.com/id/1494508936/es/foto/feliz-emocionado-y-llame-por-tel%C3%A9fono-con-una-mujer-negra-en-el-estudio-para-mensajes-de-texto.jpg?s=2048x2048&w=is&k=20&c=OEIskWFgyI7MNN67gh6zr4227gK9A54C90JNyxCN-Kg=",
);

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

final transactionsFromApi = [
  {
    "title": "Compra Supermercado",
    "date": "2026-03-09T10:30:00Z",
    "amount": -25.50
  },
  {"title": "Pago Netflix", "date": "2026-03-09T08:00:00Z", "amount": -12.99},
  {
    "title": "Transferencia recibida",
    "date": "2026-03-09T05:00:00Z",
    "amount": 150.00
  }
];

final lastTransactions =
    transactionsFromApi.map((json) => TransactionModel.fromJson(json)).toList();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(children: [
                    Row(
                      children: [
                        Welcome(user: user),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.logout),
                          onPressed: () {
                            context.go('/');
                          },
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    PlasticCard(card: card),
                  ]),
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
                            StatefulNavigationShell.of(context).goBranch(1);
                          }),
                      ActionButton(
                          icon: Icons.arrow_downward,
                          label: "Recibir",
                          onTap: () {
                            StatefulNavigationShell.of(context).goBranch(2);
                          }),
                      ActionButton(
                          icon: Icons.attach_money,
                          label: "Movimientos",
                          onTap: () {
                            StatefulNavigationShell.of(context).goBranch(2);
                          })
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cuentas",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                AccountCarousel(accounts: accounts),
                const SizedBox(height: 5),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  child: LastTransactions(transactions: lastTransactions),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_banking_app/features/home/domain/models/account_model.dart';

class AccountList extends StatelessWidget {
  final String searchQuery;

  const AccountList({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    final accounts = getAccounts()
        .where((a) => a.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: accounts.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () => {
            print("Cuenta seleccionada: ${accounts[index].number}"),
            context.push('/transfers')
          },
          title: Text(accounts[index].name),
          subtitle: Text(accounts[index].number),
        );
      },
    );
  }

  List<Account> getAccounts() {
    // Aquí deberías obtener la lista de cuentas desde tu fuente de datos
    return [
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
      Account(
        name: "Account 4",
        type: "Savings",
        number: "556677889",
        currency: "USD",
        status: "Active",
        balance: 4000.0,
      ),
    ];
  }
}

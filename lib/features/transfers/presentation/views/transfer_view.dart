import 'package:flutter/material.dart';
import 'package:mobile_banking_app/features/transfers/presentation/widgets/account_dropdown.dart';
import 'package:mobile_banking_app/features/transfers/presentation/widgets/amount_field.dart';
import 'package:mobile_banking_app/features/transfers/presentation/widgets/description_field.dart';
import 'package:mobile_banking_app/features/transfers/presentation/widgets/section_title.dart';
import 'package:mobile_banking_app/features/transfers/presentation/widgets/transfer_button.dart';
import 'package:mobile_banking_app/widgets/back_button.dart';

class TransferView extends StatefulWidget {
  const TransferView({super.key});

  @override
  State<TransferView> createState() => _TransferViewState();
}

class _TransferViewState extends State<TransferView> {
  String? debitAccount;
  String? creditAccount;

  final amountController = TextEditingController();
  final descriptionController = TextEditingController();

  final List<String> accounts = [
    "Cuenta ahorro - 123456",
    "Cuenta monetaria - 987654",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(route: '/dashboard'),
        title: const Text("Transferir dinero"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle("Cuenta de débito"),
            AccountDropdown(
              value: debitAccount,
              accounts: accounts,
              icon: Icons.account_balance_wallet,
              onChanged: (value) {
                setState(() {
                  debitAccount = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const SectionTitle("Cuenta de crédito"),
            AccountDropdown(
              value: creditAccount,
              accounts: accounts,
              icon: Icons.account_balance,
              onChanged: (value) {
                setState(() {
                  creditAccount = value;
                });
              },
            ),
            const SizedBox(height: 25),
            AmountField(controller: amountController),
            const SizedBox(height: 25),
            DescriptionField(controller: descriptionController),
            const SizedBox(height: 40),
            TransferButton(
              onPressed: () {
                print(debitAccount);
                print(creditAccount);
                print(amountController.text);
                print(descriptionController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}

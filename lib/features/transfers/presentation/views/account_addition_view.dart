import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountAdditionView extends StatefulWidget {
  const AccountAdditionView({super.key});

  @override
  State<AccountAdditionView> createState() => _AccountAdditionViewState();
}

class _AccountAdditionViewState extends State<AccountAdditionView> {
  String accountType = "Ahorro";
  String currencyType = "GTQ";
  bool isFavorite = false;

  final TextEditingController numeroCuentaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar nueva cuenta"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Tipo de cuenta",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Card(
              child: Column(
                children: [
                  RadioListTile<String>(
                    title: const Text("Cuenta de ahorro"),
                    value: "Ahorro",
                    groupValue: accountType,
                    onChanged: (value) {
                      setState(() {
                        accountType = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text("Cuenta monetaria"),
                    value: "Monetaria",
                    groupValue: accountType,
                    onChanged: (value) {
                      setState(() {
                        accountType = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Tipo de moneda",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Card(
              child: Column(
                children: [
                  RadioListTile<String>(
                    title: const Text("Quetzales (GTQ)"),
                    value: "GTQ",
                    groupValue: currencyType,
                    onChanged: (value) {
                      setState(() {
                        currencyType = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text("Dólares (USD)"),
                    value: "USD",
                    groupValue: currencyType,
                    onChanged: (value) {
                      setState(() {
                        currencyType = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: numeroCuentaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Número de cuenta",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.credit_card),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: SwitchListTile(
                title: const Text("Guardar como favorita"),
                subtitle: const Text("Se agregara a tu lista"),
                value: isFavorite,
                secondary: const Icon(Icons.star),
                onChanged: (value) {
                  setState(() {
                    isFavorite = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  print(accountType);
                  print(currencyType);
                  print(numeroCuentaController.text);
                  print(isFavorite);
                  context.push('/transfers');
                },
                child: const Text(
                  "Transferir",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

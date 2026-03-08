import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mobile_banking_app/features/home/domain/models/account.dart';
import 'package:mobile_banking_app/features/home/presentation/widgets/account_card.dart';

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
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          CarouselSlider(
            options: CarouselOptions(height: 120.0),
            items: accounts.map((account) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: AccountCard(account: account));
                },
              );
            }).toList(),
          ),
        ],
      )),
    );
  }
}

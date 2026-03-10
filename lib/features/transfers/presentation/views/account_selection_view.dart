import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
/* import 'package:mobile_banking_app/app_colors.dart';*/
import 'package:mobile_banking_app/features/transfers/presentation/widgets/account_search_bar.dart';
import 'package:mobile_banking_app/features/transfers/presentation/widgets/account_list.dart';

class AccountSelectionView extends StatefulWidget {
  const AccountSelectionView({super.key});

  @override
  State<AccountSelectionView> createState() => _AccountSelectionViewState();
}

class _AccountSelectionViewState extends State<AccountSelectionView> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Selección de cuenta a depositar",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              AccountSearchBar(
                onChanged: (String value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  context.push('/add_account');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 8),
                    Text(
                      "Agregar nueva cuenta",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: AccountList(searchQuery: _searchQuery),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

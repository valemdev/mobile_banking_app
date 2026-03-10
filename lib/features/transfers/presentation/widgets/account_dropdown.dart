import 'package:flutter/material.dart';

class AccountDropdown extends StatelessWidget {
  final String? value;
  final List<String> accounts;
  final IconData icon;
  final Function(String?) onChanged;

  const AccountDropdown({
    super.key,
    required this.value,
    required this.accounts,
    required this.icon,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: "Selecciona una cuenta",
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        items: accounts.map((account) {
          return DropdownMenuItem(
            value: account,
            child: Text(account),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}

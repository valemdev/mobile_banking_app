import 'package:flutter/material.dart';

class AccountSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const AccountSearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: "Buscar cuenta",
        prefixIcon: Icon(Icons.search),
      ),
      onChanged: onChanged,
    );
  }
}

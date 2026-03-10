import 'package:flutter/material.dart';

class TransferButton extends StatelessWidget {
  final VoidCallback onPressed;

  const TransferButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton.icon(
        icon: const Icon(Icons.send),
        onPressed: onPressed,
        label: const Text(
          "Realizar transferencia",
          style: TextStyle(fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

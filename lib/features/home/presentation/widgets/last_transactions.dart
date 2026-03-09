import 'package:flutter/material.dart';
import 'package:mobile_banking_app/app_colors.dart';

class LastTransactions extends StatelessWidget {
  const LastTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Transacciones",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Material(
                    shape: const RoundedRectangleBorder(),
                    child: InkWell(
                      customBorder: const RoundedRectangleBorder(),
                      onTap: () {
                        print("Ver todo");
                      },
                      child: const SizedBox(
                        width: 56,
                        height: 30,
                        child: Center(
                          child: Text(
                            'Ver todo',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.shopping_cart, color: Colors.white),
              ),
              title: Text("Compra #$index"),
              subtitle: Text("Hace ${index + 1} horas"),
              trailing: Text("-\$${(index + 1) * 20}"),
            );
          },
        )
      ],
    );
  }
}

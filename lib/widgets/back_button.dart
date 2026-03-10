import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key, this.route});

  final String? route;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        if (context.canPop() && route == null) {
          context.pop();
        } else if (route != null) {
          context.go(route!);
        }
      },
    );
  }
}

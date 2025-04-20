import 'package:flutter/material.dart';

class SaleScreen extends StatelessWidget {
  const SaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.flash_on,
          size: 40,
          color: Colors.black,
        ),
        Text(
          "SALE",
          style: TextStyle(color: Colors.black, fontSize: 25),
        )
      ],
    );
  }
}

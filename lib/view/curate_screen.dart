import 'package:flutter/material.dart';

class CurateScreen extends StatelessWidget {
  const CurateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.handshake,
          size: 40,
          color: Colors.black,
        ),
        Text(
          "CURATE",
          style: TextStyle(color: Colors.black, fontSize: 25),
        )
      ],
    );
  }
}

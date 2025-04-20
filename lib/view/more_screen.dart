import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.more_horiz,
          size: 40,
          color: Colors.black,
        ),
        Text(
          "MORE",
          style: TextStyle(color: Colors.black, fontSize: 25),
        )
      ],
    );
  }
}

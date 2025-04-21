import 'package:flutter/material.dart';

class LeftCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width - 50, 0);
    path.quadraticBezierTo(
      size.width,
      size.height / 2,
      size.width - 50,
      size.height,
    );
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

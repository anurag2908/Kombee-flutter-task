import 'package:flutter/material.dart';

class RightCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width,
      size.height,
    );
    path.lineTo(0, size.height);
    path.quadraticBezierTo(50, size.height / 2, 0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
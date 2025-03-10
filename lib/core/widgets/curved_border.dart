import 'package:flutter/material.dart';

class RoundedCornerClipper extends CustomClipper<Path> {
  final double radius;

  RoundedCornerClipper({required this.radius});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.addRRect(RRect.fromRectAndCorners(
      Rect.fromLTWH(0, 0, size.width, size.height),
      topLeft: Radius.circular(radius),
      topRight: Radius.circular(radius),
      bottomLeft: Radius.circular(radius),
      bottomRight: Radius.circular(radius),
    ));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double width = size.width;
    final double height = size.height;

    Path path = Path()
      ..moveTo(15, 0)
      ..lineTo(width - 15, 0)
      ..quadraticBezierTo(width, 0, width, 15)
      ..lineTo(width, height - 15)
      ..quadraticBezierTo(width, height, width - 15, height)
      ..lineTo(15, height)
      ..quadraticBezierTo(0, height, 0, height - 15)
      ..lineTo(0, 15)
      ..quadraticBezierTo(0, 0, 15, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

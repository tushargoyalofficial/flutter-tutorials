import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GreyTopClipper extends CustomClipper<Path> {
  final double yOffset;

  const GreyTopClipper({
    @required this.yOffset,
  }) : assert(yOffset != null);

  @override
  Path getClip(Size size) {
    var path = Path()
      ..lineTo(0.0, 465.0 + yOffset)
      ..quadraticBezierTo(
        size.width / 2,
        485.0 + yOffset,
        size.width,
        385.0 + yOffset,
      )
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

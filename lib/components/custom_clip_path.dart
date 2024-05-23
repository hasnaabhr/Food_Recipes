import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 500);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

 

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

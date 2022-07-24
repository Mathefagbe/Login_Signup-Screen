import 'package:flutter/material.dart';

class CustomClips extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height * 0.89);
    var firstcontrol = Offset(size.width / 5, size.height);
    var firstend = Offset(size.width / 3, size.height * 0.82);
    path.quadraticBezierTo(
        firstcontrol.dx, firstcontrol.dy, firstend.dx, firstend.dy);
    var secondcontrol = Offset(size.width / 1.2, size.height * 0.167);
    var secondend = Offset(size.width, size.height * 0.56);
    path.quadraticBezierTo(
        secondcontrol.dx, secondcontrol.dy, secondend.dx, secondend.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class WelcomeClips extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 20);
    var firstcontrol = Offset(size.width / 5, size.height);
    var firstend = Offset(size.width / 2.5, size.height - 35);
    path.quadraticBezierTo(
        firstcontrol.dx, firstcontrol.dy, firstend.dx, firstend.dy);
    var secondcontrol = Offset(size.width / 1.3, size.height - 80);
    var secondend = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(
        secondcontrol.dx, secondcontrol.dy, secondend.dx, secondend.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class VerifcationClips extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height * 0.36);
    var control = Offset(size.width / 6, size.height * 0.95);
    var end = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(control.dx, control.dy, end.dx, end.dy);
    var control2 = Offset(size.width - (size.width / 6), size.height * 0.95);
    var end2 = Offset(size.width, size.height * 0.36);
    path.quadraticBezierTo(control2.dx, control2.dy, end2.dx, end2.dy);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
